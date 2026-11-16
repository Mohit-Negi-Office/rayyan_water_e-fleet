import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/logout.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/get_saved_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/save_language.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_cubit.dart';
import 'package:rayyan_driver/features/profile/presentation/pages/profile_page.dart';

import '../../../../helpers/pump_app.dart';

class _MockGetProfile extends Mock implements GetProfile {}

class _MockGetSavedLanguage extends Mock implements GetSavedLanguage {}

class _MockSaveLanguage extends Mock implements SaveLanguage {}

class _MockLogout extends Mock implements Logout {}

const _driver = DriverProfile(
  name: 'Suresh Nair',
  code: 'DRV1007',
  email: 'driver.1007@example.com',
  dialCode: '+974',
  phoneDigits: '55001122',
  zone: '1',
  routeId: 'RT-007',
  vehicleNumber: '318238',
);

void main() {
  late DriverProfileCubit profile;

  setUpAll(() => registerFallbackValue(const NoParams()));

  setUp(() {
    final getProfile = _MockGetProfile();
    when(
      () => getProfile(any()),
    ).thenAnswer((_) async => const Success(_driver));
    profile = DriverProfileCubit(getProfile);
  });

  tearDown(() => profile.close());

  testWidgets('keeps the photo and name fixed while the menu scrolls', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(402, 500);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await profile.load();
    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider.value(value: profile),
          BlocProvider(
            create: (_) =>
                LocaleCubit(_MockGetSavedLanguage(), _MockSaveLanguage()),
          ),
          BlocProvider(create: (_) => LogoutCubit(_MockLogout())),
        ],
        child: const ProfileView(),
      ),
    );

    final menu = find.byType(ListView);
    expect(
      find.descendant(of: menu, matching: find.text('Suresh Nair')),
      findsNothing,
    );
    expect(
      find.descendant(of: menu, matching: find.text('DRV1007')),
      findsNothing,
    );
    expect(
      find.descendant(of: menu, matching: find.text('My Details')),
      findsOneWidget,
    );

    final nameTop = tester.getTopLeft(find.text('Suresh Nair')).dy;
    await tester.drag(menu, const Offset(0, -240));
    await tester.pump();

    expect(tester.getTopLeft(find.text('Suresh Nair')).dy, nameTop);
    expect(find.text('DRV1007'), findsOneWidget);
    expect(_menuExtent(tester), greaterThan(0));
  });

  testWidgets('does not scroll the menu when it fits', (tester) async {
    tester.view.physicalSize = const Size(402, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await profile.load();
    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider.value(value: profile),
          BlocProvider(
            create: (_) =>
                LocaleCubit(_MockGetSavedLanguage(), _MockSaveLanguage()),
          ),
          BlocProvider(create: (_) => LogoutCubit(_MockLogout())),
        ],
        child: const ProfileView(),
      ),
    );

    final menu = find.byType(ListView);
    expect(_menuExtent(tester), 0);

    final detailsTop = tester.getTopLeft(find.text('My Details')).dy;
    await tester.drag(menu, const Offset(0, -240));
    await tester.pump();

    expect(tester.getTopLeft(find.text('My Details')).dy, detailsTop);
  });

  testWidgets('back returns to the previous screen', (tester) async {
    await profile.load();
    final router = await tester.pumpRouted(
      const Text('Home'),
      extraRoutes: [
        GoRoute(
          path: '/profile',
          builder: (_, _) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AuthCubit()),
              BlocProvider.value(value: profile),
              BlocProvider(
                create: (_) =>
                    LocaleCubit(_MockGetSavedLanguage(), _MockSaveLanguage()),
              ),
              BlocProvider(create: (_) => LogoutCubit(_MockLogout())),
            ],
            child: const ProfileView(),
          ),
        ),
      ],
    );
    router.push('/profile');
    await tester.pumpAndSettle();

    expect(find.byTooltip('Back'), findsOneWidget);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Suresh Nair'), findsNothing);
  });
}

double _menuExtent(WidgetTester tester) {
  return tester
      .state<ScrollableState>(find.byType(Scrollable))
      .position
      .maxScrollExtent;
}
