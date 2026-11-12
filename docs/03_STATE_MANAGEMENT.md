# 03 · State Management — Bloc / Cubit Only

## 1. Hard rules

1. **`setState` is banned.** No `StatefulWidget` may call `setState`, for any reason.
2. All UI state lives in a **`Cubit`** (simple, method-driven) or **`Bloc`** (event-driven).
3. Blocs/Cubits call **use cases only** — never repositories, data sources, Dio, or storage directly.
4. States are **immutable** and modelled as **sealed unions** (see §3).
5. No `BuildContext`, widgets, `GoRouter`, or `ScaffoldMessenger` inside a Bloc/Cubit.
6. One Bloc/Cubit file + one state file (+ one event file for Bloc). Each ≤ 250 lines.

### When is a `StatefulWidget` allowed?
Only to own **controllers with a lifecycle** (`TextEditingController`, `AnimationController`,
`ScrollController`, `FocusNode`, `TabController`) — created in `initState`, disposed in `dispose`, and
**never** calling `setState`. Ephemeral UI toggles (password visibility, expanded/collapsed, selected tab)
go in a small Cubit (e.g. `ToggleCubit`/`SelectionCubit<T>` in `core/`) or a `ValueNotifier` +
`ValueListenableBuilder` local to the widget.

## 2. Cubit vs Bloc

| Use **Cubit** when… | Use **Bloc** when… |
|---|---|
| Actions map 1:1 to methods (`load()`, `refresh()`, `toggle()`) | You need event transformers (debounce search, `droppable`, `restartable`) |
| No need to trace events | Event history/traceability matters (checkout, payment, order tracking) |
| Most screens | Complex multi-step flows |

Default to **Cubit**; upgrade to Bloc when an event transformer or audit trail is needed.

## 3. State union types

Model states as sealed unions with **`freezed`** (which generates `json_serializable`-compatible code when
a state must be persisted, e.g. via `hydrated_bloc`). Use plain `@JsonSerializable` for data **models**
(`06_DATA_LAYER.md`); use `@freezed` for **state unions**.

```dart
// lib/features/orders/presentation/bloc/orders_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order.dart';

part 'orders_state.freezed.dart';

@freezed
sealed class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = OrdersInitial;
  const factory OrdersState.loading() = OrdersLoading;
  const factory OrdersState.loaded(List<Order> orders) = OrdersLoaded;
  const factory OrdersState.empty() = OrdersEmpty;
  const factory OrdersState.failure(Failure failure) = OrdersFailure;
}
```

```dart
// lib/features/orders/presentation/bloc/orders_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/orders/domain/usecases/get_orders.dart';
import 'package:rayyan_driver/features/orders/presentation/bloc/orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._getOrders) : super(const OrdersState.initial());
  final GetOrders _getOrders;

  Future<void> load() async {
    emit(const OrdersState.loading());
    final result = await _getOrders(const NoParams());
    emit(switch (result) {
      Success(:final value) when value.isEmpty => const OrdersState.empty(),
      Success(:final value) => OrdersState.loaded(value),
      Err(:final failure) => OrdersState.failure(failure),
    });
  }
}
```

> 🔁 After creating or editing any `@freezed` / `@JsonSerializable` class, **remind the user** to run:
> `dart run build_runner build --delete-conflicting-outputs`

## 4. Consuming state in the UI

```dart
BlocBuilder<OrdersCubit, OrdersState>(
  builder: (context, state) => switch (state) {
    OrdersInitial() || OrdersLoading() => const AppLoadingView(),
    OrdersEmpty() => const AppEmptyView(messageKey: 'orders_empty'),
    OrdersLoaded(:final orders) => OrdersList(orders: orders),
    OrdersFailure(:final failure) => AppErrorView(
        failure: failure,
        onRetry: context.read<OrdersCubit>().load,
      ),
  },
)
```

- Use exhaustive `switch` on sealed states — no `if (state is …)` chains, no default branch that hides cases.
- `BlocBuilder` → rebuild UI. `BlocListener` → one-off side effects (navigation via `context.go`, haptics).
  `BlocConsumer` only when both are genuinely needed.
- Use `buildWhen` / `listenWhen` / `context.select` to limit rebuilds.
- One-off effects (e.g. "navigate to order success") are modelled as a state or a separate effect stream —
  not by calling navigation inside the Cubit.

## 5. Providing Blocs

- Screen-scoped: `BlocProvider` inside the page (or the route builder), created from DI.
- App-scoped (auth session, cart badge count, connectivity): `MultiBlocProvider` in `app/app.dart`.
- Never create a Bloc inside `build()` without a provider; never pass a Bloc down through constructors
  more than one level — read it with `context.read`/`context.watch`.

## 6. Testing

Every Bloc/Cubit has a `bloc_test` suite covering: initial state, success, empty, each failure type, and
retry. Write these **before** implementing the Bloc (`08_TESTING.md`).
