import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/app/session/auth_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_cubit.dart';
import 'package:rayyan_driver/app/session/driver_profile_state.dart';
import 'package:rayyan_driver/core/assets/app_images.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/widgets/layout/curved_brand_header.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/overlays/app_confirm_sheet.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_cubit.dart';
import 'package:rayyan_driver/features/profile/presentation/bloc/logout_state.dart';
import 'package:rayyan_driver/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:rayyan_driver/features/profile/presentation/widgets/profile_menu.dart';

/// Profile (Figma `5000:105288`): photo, name and ID on the curved header,
/// then the menu. Logout asks first (`5000:105534`).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LogoutCubit>(),
      child: const ProfileView(),
    );
  }
}

/// Profile content, separated from DI for testing.
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  /// Measured below the status bar.
  static const double _avatarTop = 49;
  static const double _nameGap = 10;
  static const double _menuGap = 20;
  static const double _figmaStatusBar = 59;
  static const double _sheetIllustration = 120;

  Future<void> _confirmLogout(BuildContext context) async {
    final l10n = context.l10n;
    final cubit = context.read<LogoutCubit>();
    final confirmed = await AppConfirmSheet.show(
      context,
      title: l10n.profileLogoutTitle,
      message: l10n.profileLogoutMessage,
      actionLabel: l10n.profileLogout,
      cancelLabel: l10n.commonGoBack,
      illustration: Image.asset(
        AppImages.logout,
        width: _sheetIllustration,
        height: _sheetIllustration,
      ),
    );
    if (confirmed) await cubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final state = context.watch<DriverProfileCubit>().state;
    final profile = state.profile;
    return BlocListener<LogoutCubit, LogoutState>(
      listenWhen: (_, now) => now is LogoutDone,
      listener: (context, _) => context.read<AuthCubit>().signedOut(),
      child: TintedScaffold(
        body: Stack(
          children: [
            CurvedBrandHeader(
              crest: CurvedBrandHeader.profileCrest - _figmaStatusBar + top,
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.screenGutter,
                top + _avatarTop,
                AppSpacing.screenGutter,
                AppSpacing.s6 + MediaQuery.paddingOf(context).bottom,
              ),
              children: [
                Center(
                  child: ProfileAvatar(
                    url: profile?.photoUrl,
                    size: ProfileAvatar.headerSize,
                    ring: ProfileAvatar.headerRing,
                  ),
                ),
                const SizedBox(height: _nameGap),
                if (profile != null)
                  ProfileNameBlock(name: profile.name, code: profile.code),
                if (state case DriverProfileFailure(:final failure))
                  AppErrorView.compact(
                    failure: failure,
                    onRetry: context.read<DriverProfileCubit>().load,
                  ),
                const SizedBox(height: _menuGap),
                ProfileMenu(onLogout: () => _confirmLogout(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
