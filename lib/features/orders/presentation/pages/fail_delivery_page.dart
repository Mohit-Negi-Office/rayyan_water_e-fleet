import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/error/failure_ui_x.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/core/widgets/feedback/app_inline_banner.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/fail_delivery_cubit.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/fail_delivery_state.dart';
import 'package:rayyan_driver/features/orders/presentation/widgets/fail_reason_list.dart';

/// "Fail Delivery" (Figma `5672:39363`, `5691:36918`): pick a reason,
/// write one for "Others", then Submit. Pops with the failed order.
class FailDeliveryPage extends StatelessWidget {
  const FailDeliveryPage({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FailDeliveryCubit>(param1: orderId),
      child: const FailDeliveryView(),
    );
  }
}

/// Fail Delivery content, separated from DI for testing.
class FailDeliveryView extends StatelessWidget {
  const FailDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<FailDeliveryCubit>();
    return BlocConsumer<FailDeliveryCubit, FailDeliveryState>(
      listenWhen: (before, now) => now.result != null && before.result == null,
      listener: (context, state) => context.pop(state.result),
      builder: (context, state) {
        final failure = state.failure;
        return TintedScaffold(
          appBar: AppTopBar(title: l10n.failDeliveryTitle),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenGutter,
                AppSpacing.s3,
                AppSpacing.screenGutter,
                AppSpacing.s4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.isReasonMissing || failure != null) ...[
                    AppInlineBanner.error(
                      message: failure == null
                          ? l10n.failReasonRequired
                          : failure.toMessage(l10n),
                    ),
                    const SizedBox(height: AppSpacing.s3),
                  ],
                  AppButton(
                    label: l10n.commonSubmit,
                    variant: AppButtonVariant.danger,
                    size: AppButtonSize.large,
                    isExpanded: true,
                    isLoading: state.isSubmitting,
                    onPressed: cubit.submit,
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenGutter,
              0,
              AppSpacing.screenGutter,
              AppSpacing.s6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.failDeliveryPrompt,
                  style: context.textStyles.pageTitle.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.s4),
                FailReasonList(
                  selected: state.reason,
                  onSelected: cubit.reasonSelected,
                  onNoteChanged: cubit.noteChanged,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
