# 08 · Testing — Test-Driven Execution

## 1. Rule

Before implementing a **new complex functional logic block** or a **pure Dart utility**, write the unit or
widget tests **first**. Then implement until they pass. Validate by running **`flutter test`**.

"Complex logic" includes: use cases with branching, price/cart/discount/tax calculations, delivery-slot
and scheduling rules, validators & formatters, repository error mapping, Bloc/Cubit flows, router
redirect logic, pagination.

## 2. The TDD loop (agent procedure)

1. **Red** — create the test file mirroring the source path; write tests describing the behaviour (happy path, edge cases, failures). Run `flutter test <path>` and confirm it fails for the right reason.
2. **Green** — write the minimal implementation to pass.
3. **Refactor** — clean up (SOLID, ≤ 250 lines), keep tests green.
4. **Validate** — run the full suite: `flutter test`, plus `flutter analyze`. Report results to the user.

Never mark a task done with failing or skipped tests. Never delete/weaken a test to make it pass.

## 3. Tooling

| Package | Purpose |
|---|---|
| `flutter_test` | Unit & widget tests |
| `bloc_test` | Bloc/Cubit state sequences |
| `mocktail` | Mocks/fakes (no codegen) |
| `golden_toolkit` / `alchemist` (`TODO(team)` pick one) | Golden tests for shared widgets |
| `integration_test` | End-to-end critical flows |

## 4. Layout

```
test/
├── fixtures/                 # JSON fixtures: order_list.json …
├── helpers/                  # pumpApp(), test router, fake DI, fixture reader
├── core/…                    # mirrors lib/core
└── features/<feature>/
    ├── data/{models,datasources,repositories}/
    ├── domain/usecases/
    └── presentation/{bloc,pages,widgets}/
```

File naming: `<source_file>_test.dart`. Every test file ≤ 250 lines — split by group if needed.

## 5. What each layer tests

| Layer | Minimum tests |
|---|---|
| `core/utils` | All branches & edge cases (empty, null-ish, boundaries, locale) |
| Models | `fromJson` fixture, `toJson` round-trip, unknown enum → fallback |
| Repositories | Success mapping; every `AppException` → correct `Failure` |
| Use cases | Delegation + any business rules |
| Bloc/Cubit | initial; loading→loaded; loading→empty; loading→failure; retry |
| Widgets/pages | Renders each state (loading/empty/loaded/error); key interactions; Retry wiring; no SnackBar for data errors |
| Router | Redirect function; deep link renders correct page |

## 6. Examples

```dart
// test/features/orders/presentation/bloc/orders_cubit_test.dart
class _MockGetOrders extends Mock implements GetOrders {}

void main() {
  late _MockGetOrders getOrders;
  setUpAll(() => registerFallbackValue(const NoParams()));
  setUp(() => getOrders = _MockGetOrders());

  blocTest<OrdersCubit, OrdersState>(
    'emits [loading, loaded] when orders exist',
    build: () {
      when(() => getOrders(any())).thenAnswer((_) async => Success([tOrder]));
      return OrdersCubit(getOrders);
    },
    act: (cubit) => cubit.load(),
    expect: () => [const OrdersState.loading(), OrdersState.loaded([tOrder])],
  );

  blocTest<OrdersCubit, OrdersState>(
    'emits [loading, failure] on network failure',
    build: () {
      when(() => getOrders(any())).thenAnswer((_) async => const Err(NetworkFailure()));
      return OrdersCubit(getOrders);
    },
    act: (cubit) => cubit.load(),
    expect: () => [const OrdersState.loading(), const OrdersState.failure(NetworkFailure())],
  );
}
```

```dart
// Widget test: error renders in tree, not as SnackBar
testWidgets('shows AppErrorView on failure', (tester) async {
  when(() => cubit.state).thenReturn(const OrdersState.failure(NetworkFailure()));
  await tester.pumpApp(BlocProvider.value(value: cubit, child: const OrdersView()));
  expect(find.byType(AppErrorView), findsOneWidget);
  expect(find.byType(SnackBar), findsNothing);
});
```

`pumpApp` (in `test/helpers/`) wraps the widget with `MaterialApp`, the real app theme, and localizations.

## 7. Commands

```bash
flutter test                              # whole suite (required before finishing)
flutter test test/features/orders         # one feature
flutter test --coverage                   # coverage → coverage/lcov.info
flutter test --update-goldens             # only when a visual change is intentional
```

Coverage target: domain + data ≥ 90%, presentation logic (Blocs) ≥ 90%, overall ≥ 80% — `TODO(team)` confirm.
