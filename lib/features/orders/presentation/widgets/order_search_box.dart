import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayyan_driver/core/l10n/l10n_x.dart';
import 'package:rayyan_driver/core/widgets/inputs/app_search_input.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_list_cubit.dart';

/// "Search Order": filters the list by order number or customer.
class OrderSearchBox extends StatefulWidget {
  const OrderSearchBox({super.key});

  @override
  State<OrderSearchBox> createState() => _OrderSearchBoxState();
}

class _OrderSearchBoxState extends State<OrderSearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppSearchInput(
      controller: _controller,
      hint: l10n.ordersSearchHint,
      clearTooltip: l10n.commonClearSearch,
      onChanged: context.read<OrdersListCubit>().queryChanged,
    );
  }
}
