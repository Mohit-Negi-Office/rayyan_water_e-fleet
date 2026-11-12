import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_state.dart';
import 'package:rayyan_driver/core/assets/app_svgs.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/phone_formatter.dart';
import 'package:rayyan_driver/core/widgets/inputs/read_only_field.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_loading_view.dart';
import 'package:rayyan_driver/features/profile/domain/entities/driver_profile.dart';
import 'package:rayyan_driver/features/profile/presentation/widgets/profile_avatar.dart';

/// "My Details" (Figma `5000:105351`): what the fleet holds about the
/// driver, read-only.
class MyDetailsPage extends StatelessWidget {
  const MyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DriverProfileCubit>().state;
    return TintedScaffold(
      wash: PageWash.detail,
      appBar: AppTopBar(title: context.l10n.profileMyDetails),
      body: switch (state) {
        DriverProfileLoading() => const AppLoadingView(),
        DriverProfileFailure(:final failure) => AppErrorView(
          failure: failure,
          onRetry: context.read<DriverProfileCubit>().load,
        ),
        DriverProfileLoaded(:final profile) => _Details(profile: profile),
      },
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.profile});

  static const double _top = 4;
  static const double _gap = 20;
  static const double _flag = 19;

  final DriverProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        _top,
        AppSpacing.screenGutter,
        AppSpacing.s6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: ProfileAvatar(
              url: profile.photoUrl,
              size: ProfileAvatar.detailsSize,
            ),
          ),
          const SizedBox(height: AppSpacing.s3),
          ProfileNameBlock(name: profile.name, code: profile.code),
          const SizedBox(height: _gap),
          ReadOnlyField(label: l10n.detailsEmail, value: profile.email),
          const SizedBox(height: _gap),
          ReadOnlyField(
            label: l10n.detailsMobile,
            labelGap: AppSpacing.s2,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppSvgs.flagQatar,
                    width: _flag,
                    height: _flag,
                    excludeFromSemantics: true,
                  ),
                  const SizedBox(width: AppSpacing.s2),
                  Text(profile.dialCode),
                  const SizedBox(width: AppSpacing.s2),
                  Text(
                    '|',
                    style: context.textStyles.bodyLight.copyWith(
                      color: colors.textMuted,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s2),
                  Expanded(
                    child: Text(PhoneFormatter.grouped(profile.phoneDigits)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: _gap),
          ReadOnlyField(label: l10n.detailsZone, value: profile.zone),
          const SizedBox(height: _gap),
          ReadOnlyField(label: l10n.detailsRouteId, value: profile.routeId),
          const SizedBox(height: _gap),
          ReadOnlyField(
            label: l10n.detailsVehicleNumber,
            value: profile.vehicleNumber,
          ),
        ],
      ),
    );
  }
}
