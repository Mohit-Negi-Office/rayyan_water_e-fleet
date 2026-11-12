import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/error/failure_ui_x.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/utils/validators/qatar_mobile_validator.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/feedback/app_inline_banner.dart';
import 'package:rayyan_driver/core/widgets/inputs/field_frame.dart';
import 'package:rayyan_driver/core/widgets/inputs/phone_number_field.dart';
import 'package:rayyan_driver/features/auth/domain/entities/phone_number.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rayyan_driver/features/auth/presentation/bloc/login_state.dart';

/// Mobile number and Continue.
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  /// Space under the field that holds "Incorrect Number" without moving
  /// Continue (measured: Continue sits 40pt below the field either way).
  static const double _errorSlot = AppSpacing.s7;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final otherFailure = state.otherFailure;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PhoneNumberField(
              dialCode: PhoneNumber.qatarDialCode,
              hint: l10n.authMobileHint,
              maxDigits: QatarMobileValidator.length,
              onChanged: cubit.digitsChanged,
              onSubmitted: (_) => cubit.submit(),
            ),
            const SizedBox(height: AppSpacing.s2),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: _errorSlot),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: state.isNumberIncorrect
                    ? FieldErrorText(l10n.authIncorrectNumber)
                    : null,
              ),
            ),
            if (otherFailure != null) ...[
              AppInlineBanner.error(message: otherFailure.toMessage(l10n)),
              const SizedBox(height: AppSpacing.s4),
            ],
            AppButton(
              label: l10n.commonContinue,
              onPressed: state.canContinue ? cubit.submit : null,
              size: AppButtonSize.large,
              isExpanded: true,
              isLoading: state.isSubmitting,
            ),
          ],
        );
      },
    );
  }
}
