# 02 · Architecture — Clean Architecture, Feature-First

The codebase is organised **by feature first**, and **inside each feature** by the three strict Clean
Architecture layers: `presentation`, `domain`, `data`.

## 1. Folder layout

```
lib/
├── main.dart                     # bootstraps: DI, router, runApp — nothing else
├── app/
│   ├── app.dart                  # MaterialApp.router + theme + BlocProviders that are app-wide
│   ├── router/                   # go_router config (see 05_NAVIGATION.md)
│   └── di/                       # get_it / injectable setup
├── core/                         # shared, feature-agnostic code
│   ├── theme/                    # tokens & ThemeData (01_THEME.md)
│   ├── widgets/                  # shared reusable widgets (AppButton, AppTextField, ErrorView…)
│   ├── error/                    # Failure, AppException, mappers (07_ERROR_HANDLING.md)
│   ├── network/                  # Dio client, interceptors, ApiEndpoints
│   ├── storage/                  # secure storage / local cache wrappers
│   ├── usecase/                  # UseCase base class
│   ├── utils/                    # pure Dart helpers (formatters, validators) — TDD required
│   └── extensions/
└── features/
    └── <feature_name>/
        ├── data/
        │   ├── datasources/      # <feature>_remote_data_source.dart, <feature>_local_data_source.dart
        │   ├── models/           # DTOs with @JsonSerializable + toEntity()/fromEntity()
        │   └── repositories/     # <feature>_repository_impl.dart
        ├── domain/
        │   ├── entities/         # plain immutable Dart classes
        │   ├── repositories/     # abstract <feature>_repository.dart (contract)
        │   └── usecases/         # one class per use case
        └── presentation/
            ├── bloc/             # <feature>_bloc/cubit + state (+ event)
            ├── pages/            # route-level screens (one per route)
            └── widgets/          # feature-local widgets
test/                             # mirrors lib/ exactly
```

### Mobile App features

Derived from the Figma *Final Designs* page — full screen inventory and node IDs in
[`11_FEATURES_AND_SCREENS.md`](11_FEATURES_AND_SCREENS.md). Create a feature folder **only** when work on it starts.

```
features/
├── onboarding/      # splash, language selection
├── auth/            # mobile login, OTP, fill details
├── home/            # home feed sections
├── notifications/
├── catalog/         # product list, categories, search, filter, product detail
├── favourites/
├── cart/            # cart, add-ons, coupons, order summary
├── checkout/        # address, slot, repeat order, payment method, order placed
├── addresses/       # map picker, saved addresses, add/edit, photo auto-fill
├── orders/          # order history, reorder (Home "Easy Reorder" uses orders' domain)
├── payments/        # saved cards, payment methods
├── rewards/         # points, coupons
├── profile/         # account, change mobile/email, delete account
└── support/         # WhatsApp support, About, policies
```

Cross-feature examples (domain-only access): `home` uses `catalog`, `orders` and `notifications` use
cases; `checkout` uses `cart`, `addresses`, `payments` use cases.

> 🚫 **Rider App:** no `rider_*` features, routes, or models in this codebase.

## 2. The dependency rule

```
presentation ──► domain ◄── data
```

| Layer | May import | Must NOT import |
|---|---|---|
| **domain** | Dart SDK, `equatable`/`meta`, `core/error`, `core/usecase` | `package:flutter/*`, `dio`, `json_annotation`, anything in `data/` or `presentation/` |
| **data** | `domain` of the **same** feature, `core/network`, `core/storage`, `core/error`, `json_annotation`, `dio` | `presentation/`, `package:flutter/widgets.dart` |
| **presentation** | `domain` of the same feature, `core/widgets`, `core/theme`, `flutter_bloc`, `go_router` | `data/` (no models, no repository impls, no data sources) |

- **Cross-feature access:** a feature may depend on another feature's **domain** (entities / use cases) only.
  Never on another feature's `data` or `presentation`. If two features need the same widget, move it to `core/widgets/`.
- `core/` must never import from `features/`.

## 3. Responsibilities per layer

### Domain (business rules — pure Dart)
- **Entities**: immutable, `Equatable` or `freezed` (without JSON). No `fromJson`.
- **Repository contracts**: `abstract interface class OrderRepository { Future<Result<List<Order>>> getOrders(); }`
- **Use cases**: one public method `call`, single responsibility.

```dart
// lib/features/orders/domain/usecases/get_orders.dart
import 'package:rayyan_driver/core/error/result.dart';
import 'package:rayyan_driver/core/usecase/usecase.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order.dart';
import 'package:rayyan_driver/features/orders/domain/repositories/order_repository.dart';

final class GetOrders implements UseCase<List<Order>, NoParams> {
  const GetOrders(this._repository);
  final OrderRepository _repository;

  @override
  Future<Result<List<Order>>> call(NoParams params) => _repository.getOrders();
}
```

### Data (talks to the outside world)
- **Data sources** throw typed `AppException`s.
- **Repository impl** catches exceptions, maps DTO → entity, returns `Result<T>` (`Success` / `Failure`).
- **Models/DTOs** use `json_serializable` (`06_DATA_LAYER.md`).

### Presentation (UI + UI state)
- **Pages**: compose widgets, provide/consume Bloc, no business logic.
- **Bloc/Cubit**: call use cases, emit states. Never call repositories or data sources directly.
- **Widgets**: stateless where possible; driven by Bloc state.

## 4. Dependency injection

- `get_it` + `injectable`. Register in `lib/app/di/`.
- Data sources & repositories: `@LazySingleton(as: OrderRepository)`.
- Use cases: `@injectable` (factory) or lazy singleton.
- Blocs/Cubits: `@injectable` (factory) — created per screen via `BlocProvider(create: (_) => getIt<OrdersCubit>())`.
- Widgets never call `getIt` except at the `BlocProvider.create` boundary in pages or the router.

## 5. SOLID applied

| Principle | In this codebase |
|---|---|
| **S** — Single Responsibility | One use case = one action. One Bloc per screen concern. Widgets do layout only. |
| **O** — Open/Closed | Extend shared widgets via parameters/variants/composition, not by copy-pasting. |
| **L** — Liskov | Every `*RepositoryImpl` fully honours its contract — same error semantics, no `UnimplementedError` in prod. |
| **I** — Interface Segregation | Small repository contracts per feature; don't build a god `ApiRepository`. |
| **D** — Dependency Inversion | Blocs depend on use cases; use cases depend on abstract repositories; impls injected via DI. |

## 6. Adding a new feature — order of work

1. `domain/entities` → `domain/repositories` (contract) → `domain/usecases` (**tests first**).
2. `data/models` (+ remind: run `build_runner`) → `data/datasources` → `data/repositories` (**tests first**).
3. `presentation/bloc` (**bloc_test first**) → `presentation/widgets` → `presentation/pages`.
4. Register DI, add route in `app/router/`.
5. `flutter analyze` + `flutter test`.
