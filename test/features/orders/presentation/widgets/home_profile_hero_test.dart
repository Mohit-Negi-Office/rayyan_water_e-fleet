import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rayyan_driver/app/locale/locale_cubit.dart';
import 'package:rayyan_driver/app/router/app_routes.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/core/utils/clock.dart';
import 'package:rayyan_driver/core/widgets/media/driver_photo_hero.dart';
import 'package:rayyan_driver/features/auth/domain/usecases/logout.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/get_saved_language.dart';
import 'package:rayyan_driver/features/onboarding/domain/usecases/save_language.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/current_time_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/home_header.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/get_profile.dart';
import 'package:rayyan_driver/features/profile/domain/usecases/request_profile.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_cubit.dart';
import 'package:rayyan_driver/features/profile/presentation/pages/profile_page.dart';

import '../../../../helpers/pump_app.dart';

class _MockGetProfile extends Mock implements GetProfile {}

class _MockRequestProfile extends Mock implements RequestProfile {}

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
    final requestProfile = _MockRequestProfile();
    when(
      () => getProfile(any()),
    ).thenAnswer((_) async => const Success(_driver));
    when(
      () => requestProfile(any()),
    ).thenAnswer((_) async => const Success(_driver));
    profile = DriverProfileCubit(getProfile, requestProfile);
  });

  tearDown(() => profile.close());

  testWidgets('the home photo flies into the profile photo and back', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await profile.load();
    final router = await tester.pumpRouted(
      BlocProvider(
        create: (_) => CurrentTimeCubit(const Clock()),
        child: HomeHeader(name: _driver.name),
      ),
      extraRoutes: [
        GoRoute(
          name: AppRoutes.profile.name,
          path: AppRoutes.profile.path,
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

    expect(find.byType(DriverPhotoHero), findsOneWidget);
    await tester.tap(find.byType(DriverPhotoHero));
    await tester.pump();
    expect(router.state.uri.path, AppRoutes.profile.path);
    await tester.pump(const Duration(milliseconds: 200));
    _expectPhotoInFlight(tester);

    await tester.pumpAndSettle();
    expect(find.text(_driver.name), findsOneWidget);
    expect(
      find.byType(DriverPhotoHero, skipOffstage: false),
      findsNWidgets(2),
    );

    await tester.tap(find.byTooltip('Back'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    _expectPhotoInFlight(tester);

    await tester.pumpAndSettle();
    expect(find.text(_driver.name), findsNothing);
    expect(find.byType(DriverPhotoHero), findsOneWidget);
  });
}

/// The two photos are hidden and one square image is between their sizes.
void _expectPhotoInFlight(WidgetTester tester) {
  final heroes = find.byType(Hero);
  expect(heroes, findsNWidgets(2));
  for (final element in heroes.evaluate()) {
    late Widget built;
    element.visitChildren((child) => built = child.widget);
    expect(built, isA<SizedBox>());
  }

  final flying = tester
      .renderObjectList<RenderBox>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Material && widget.type == MaterialType.transparency,
        ),
      )
      .map((box) => box.size)
      .where((size) => size.width > 50 && size.width < 84)
      .toList();
  expect(flying, hasLength(1));
  expect(flying.single.height, moreOrLessEquals(flying.single.width));
}
