import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_loading_view.dart';
import 'package:rayyan_driver/features/support/domain/entities/policy_document.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/policy_cubit.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/policy_state.dart';
import 'package:rayyan_driver/features/support/presentation/widgets/policy_labels_x.dart';

/// About Us, Terms & Conditions or Privacy policy (Figma `5000:105723`,
/// `5000:105748`, `5000:105773`).
class PolicyPage extends StatelessWidget {
  const PolicyPage({required this.type, super.key});

  final PolicyType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PolicyCubit>(param1: type)..load(),
      child: PolicyView(type: type),
    );
  }
}

/// Policy content, separated from DI for testing.
class PolicyView extends StatelessWidget {
  const PolicyView({required this.type, super.key});

  final PolicyType type;

  @override
  Widget build(BuildContext context) {
    return TintedScaffold(
      wash: PageWash.detail,
      appBar: AppTopBar(title: context.policyTitle(type)),
      body: BlocBuilder<PolicyCubit, PolicyState>(
        builder: (context, state) => switch (state) {
          PolicyLoading() => const AppLoadingView(),
          PolicyFailure(:final failure) => AppErrorView(
            failure: failure,
            onRetry: context.read<PolicyCubit>().load,
          ),
          PolicyLoaded(:final document) => _Document(document: document),
        },
      ),
    );
  }
}

class _Document extends StatelessWidget {
  const _Document({required this.document});

  static const double _top = 4;
  static const double _sectionGap = AppSpacing.s4;

  final PolicyDocument document;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final sections = document.sections;
    final body = styles.bodyLightLoose.copyWith(color: colors.textSecondary);
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        _top,
        AppSpacing.screenGutter,
        AppSpacing.s6 + MediaQuery.paddingOf(context).bottom,
      ),
      itemCount: sections.length + 1,
      itemBuilder: (context, i) {
        if (i == 0) {
          return Text(
            context.l10n.policyLastUpdated(
              AppDateFormatter.monthYear(document.updatedAt, locale),
            ),
            style: body,
          );
        }
        final section = sections[i - 1];
        final heading = section.heading;
        return Padding(
          padding: EdgeInsets.only(
            top: heading == null ? AppSpacing.s3 : _sectionGap,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (heading != null) ...[
                Semantics(
                  header: true,
                  child: Text(
                    heading,
                    style: styles.pageTitle.copyWith(color: colors.textPrimary),
                  ),
                ),
                const SizedBox(height: AppSpacing.s3),
              ],
              Text(section.body, style: body),
            ],
          ),
        );
      },
    );
  }
}
