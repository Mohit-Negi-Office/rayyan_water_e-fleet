import 'package:flutter/material.dart';
import 'package:rayyan_driver/core/assets/app_icons.dart';
import 'package:rayyan_driver/core/theme/app_radius.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/utils/formatters/date_formatter.dart';
import 'package:rayyan_driver/core/widgets/buttons/app_icon_button.dart';

/// Labels the calendar needs from the caller's strings.
class MonthCalendarLabels {
  const MonthCalendarLabels({required this.previous, required this.next});

  final String previous;
  final String next;
}

/// Month grid ("Oct 2026", S M T W T F S) for picking a day. Days outside
/// the month or not [isEnabled] are grey. Owns the shown month in a
/// [ValueNotifier]; no setState.
class MonthCalendar extends StatefulWidget {
  const MonthCalendar({
    required this.isEnabled,
    required this.onSelected,
    required this.labels,
    this.selected,
    this.isSelected,
    this.initialMonth,
    super.key,
  });

  final bool Function(DateTime day) isEnabled;
  final ValueChanged<DateTime> onSelected;
  final MonthCalendarLabels labels;
  final DateTime? selected;

  /// Marks several days (a range, or chosen dates) instead of [selected].
  final bool Function(DateTime day)? isSelected;
  final DateTime? initialMonth;

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late final ValueNotifier<DateTime> _month = ValueNotifier(
    _first(widget.selected ?? widget.initialMonth ?? DateTime.now()),
  );

  static DateTime _first(DateTime d) => DateTime(d.year, d.month);

  @override
  void dispose() {
    _month.dispose();
    super.dispose();
  }

  void _shift(int months) {
    final m = _month.value;
    _month.value = DateTime(m.year, m.month + months);
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s2),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: colors.inputBorder),
      ),
      child: ValueListenableBuilder<DateTime>(
        valueListenable: _month,
        builder: (context, month, _) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(
              title: AppDateFormatter.monthTitle(month, locale),
              labels: widget.labels,
              onPrevious: () => _shift(-1),
              onNext: () => _shift(1),
            ),
            _Grid(
              month: month,
              locale: locale,
              isSelected:
                  widget.isSelected ??
                  (d) {
                    final s = widget.selected;
                    return s != null && DateUtils.isSameDay(s, d);
                  },
              isEnabled: widget.isEnabled,
              onSelected: widget.onSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
    required this.labels,
    required this.onPrevious,
    required this.onNext,
  });

  final String title;
  final MonthCalendarLabels labels;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    Widget arrow(String icon, String tooltip, VoidCallback onTap) =>
        Transform.flip(
          flipX: isRtl,
          child: AppIconButton(
            icon: icon,
            tooltip: tooltip,
            onPressed: onTap,
            color: colors.iconPrimary,
            iconSize: AppIconSizes.search,
          ),
        );
    return Row(
      children: [
        arrow(AppIcons.chevronStart, labels.previous, onPrevious),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.textStyles.priceSmall.copyWith(
              color: colors.textPrimary,
            ),
          ),
        ),
        arrow(AppIcons.chevronEnd, labels.next, onNext),
      ],
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({
    required this.month,
    required this.locale,
    required this.isSelected,
    required this.isEnabled,
    required this.onSelected,
  });

  static const int _weeks = 6;
  static const int _days = DateTime.daysPerWeek;
  static const double _cell = 32;

  final DateTime month;
  final String locale;
  final bool Function(DateTime) isSelected;
  final bool Function(DateTime) isEnabled;
  final ValueChanged<DateTime> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.textStyles;
    // Weeks start on Sunday, as in the design.
    final lead = month.weekday % _days;
    final start = DateTime(month.year, month.month, 1 - lead);
    DateTime at(int i) => DateTime(start.year, start.month, start.day + i);
    Widget header(int i) => Expanded(
      child: Center(
        child: Text(
          AppDateFormatter.weekdayNarrow(at(i), locale),
          style: styles.label.copyWith(color: colors.textTertiary),
        ),
      ),
    );
    Widget day(DateTime d) {
      final inMonth = d.month == month.month;
      final enabled = inMonth && isEnabled(d);
      final isPicked = inMonth && isSelected(d);
      return Expanded(
        child: Center(
          child: InkResponse(
            onTap: enabled ? () => onSelected(d) : null,
            radius: _cell / 2,
            child: Container(
              width: _cell,
              height: _cell,
              alignment: Alignment.center,
              decoration: isPicked
                  ? BoxDecoration(
                      color: colors.brand,
                      borderRadius: BorderRadius.circular(AppRadius.l),
                    )
                  : null,
              child: Text(
                '${d.day}',
                style: styles.label.copyWith(
                  color: isPicked
                      ? colors.onBrand
                      : enabled
                      ? colors.textPrimary
                      : colors.textMuted,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(children: [for (var i = 0; i < _days; i++) header(i)]),
        for (var w = 0; w < _weeks; w++)
          if (w < 5 || at(w * _days).month == month.month)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.s1),
              child: Row(
                children: [
                  for (var i = 0; i < _days; i++) day(at(w * _days + i)),
                ],
              ),
            ),
      ],
    );
  }
}
