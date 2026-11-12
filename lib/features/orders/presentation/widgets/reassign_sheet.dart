import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/error/failure_ui_x.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_gradients.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/feedback/app_inline_banner.dart';
import 'package:rayyan_driver/core/widgets/inputs/app_text_area.dart';
import 'package:rayyan_driver/core/widgets/layout/gradient_rule.dart';
import 'package:rayyan_driver/core/widgets/overlays/app_bottom_sheet.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order_detail.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/reassign_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/reassign_state.dart';

/// "Re-Assign Order" (Figma `5000:101214`): why, then Confirm. Resolves to
/// the re-assigned order, or null when closed.
class ReassignSheet extends StatelessWidget {
  const ReassignSheet({super.key});

  /// Measured: the reason box is 150pt tall.
  static const double _boxHeight = 150;
  static const double _labelGap = 6;

  static Future<OrderDetail?> show(
    BuildContext context, {
    required String orderId,
  }) => showAppBottomSheet<OrderDetail>(
    context: context,
    topPadding: AppSheetFrame.reassignTop,
    builder: (_) => BlocProvider(
      create: (_) => getIt<ReassignCubit>(param1: orderId),
      child: const ReassignSheet(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final styles = context.textStyles;
    final cubit = context.read<ReassignCubit>();
    return BlocConsumer<ReassignCubit, ReassignState>(
      listenWhen: (before, now) => now.result != null && before.result == null,
      listener: (context, state) => context.pop(state.result),
      builder: (context, state) {
        final failure = state.failure;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.reassignTitle,
              style: styles.pageTitle.copyWith(color: colors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.s4),
            Text(
              l10n.reassignMessage,
              style: styles.bodyLight.copyWith(color: colors.textPrimary),
            ),
            const SizedBox(height: _labelGap),
            AppTextArea(
              hint: l10n.reassignReasonHint,
              height: _boxHeight,
              onChanged: cubit.reasonChanged,
            ),
            const SizedBox(height: AppSpacing.s4),
            GradientRule(gradient: AppGradients.sheetRule),
            const SizedBox(height: AppSpacing.s4),
            if (failure != null) ...[
              AppInlineBanner.error(message: failure.toMessage(l10n)),
              const SizedBox(height: AppSpacing.s3),
            ],
            AppButton(
              label: l10n.commonConfirm,
              size: AppButtonSize.large,
              isExpanded: true,
              isLoading: state.isSubmitting,
              onPressed: state.canSubmit ? cubit.submit : null,
            ),
          ],
        );
      },
    );
  }
}
