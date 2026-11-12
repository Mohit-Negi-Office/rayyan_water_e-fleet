import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/app/di/injection.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/layout/tinted_scaffold.dart';
import 'package:rayyan_driver/core/widgets/navigation/app_top_bar.dart';
import 'package:rayyan_driver/core/widgets/states/app_empty_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_error_view.dart';
import 'package:rayyan_driver/core/widgets/states/app_loading_view.dart';
import 'package:rayyan_driver/features/support/domain/entities/faq.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/faqs_cubit.dart';
import 'package:rayyan_driver/features/support/presentation/bloc/faqs_state.dart';
import 'package:rayyan_driver/features/support/presentation/widgets/faq_tile.dart';

/// "FAQs" (Figma `5000:105681`).
class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FaqsCubit>()..load(),
      child: const FaqsView(),
    );
  }
}

/// FAQs content, separated from DI for testing.
class FaqsView extends StatelessWidget {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TintedScaffold(
      wash: PageWash.detail,
      appBar: AppTopBar(title: l10n.faqsTitle),
      body: BlocBuilder<FaqsCubit, FaqsState>(
        builder: (context, state) => switch (state) {
          FaqsLoading() => const AppLoadingView(),
          FaqsFailure(:final failure) => AppErrorView(
            failure: failure,
            onRetry: context.read<FaqsCubit>().load,
          ),
          FaqsLoaded(:final faqs) when faqs.isEmpty => AppEmptyView(
            title: l10n.faqsEmpty,
          ),
          FaqsLoaded(:final faqs, :final expanded) => _List(
            faqs: faqs,
            expanded: expanded,
          ),
        },
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({required this.faqs, required this.expanded});

  static const double _top = 4;
  static const double _gap = 14;

  final List<Faq> faqs;
  final int? expanded;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FaqsCubit>();
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        _top,
        AppSpacing.screenGutter,
        AppSpacing.s6 + MediaQuery.paddingOf(context).bottom,
      ),
      itemCount: faqs.length + 1,
      separatorBuilder: (_, index) =>
          SizedBox(height: index == 0 ? AppSpacing.s4 : _gap),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            context.l10n.faqsSubtitle,
            style: context.textStyles.subtitleLight.copyWith(
              color: context.colors.textTertiary,
            ),
          );
        }
        final i = index - 1;
        return FaqTile(
          faq: faqs[i],
          isExpanded: i == expanded,
          onTap: () => cubit.toggle(i),
        );
      },
    );
  }
}
