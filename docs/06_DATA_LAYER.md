# 06 · Data Layer — Models, Data Sources, Repositories, Codegen

## 1. Models (DTOs) — `json_serializable`

- Every API/local-storage model is a `@JsonSerializable` class in `features/<f>/data/models/`.
- Models are **data-layer only**. They map to/from domain **entities**; entities never have JSON code.
- Never hand-write `fromJson`/`toJson`.

```dart
// lib/features/orders/data/models/order_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:rayyan_driver/features/orders/domain/entities/order.dart';

part 'order_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class OrderModel {
  const OrderModel({
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  final String id;
  @JsonKey(unknownEnumValue: OrderStatusDto.unknown)
  final OrderStatusDto status;
  final double totalAmount;
  final DateTime createdAt;

  Order toEntity() => Order(
        id: id,
        status: status.toDomain(),
        total: totalAmount,
        createdAt: createdAt,
      );
}
```

Conventions:
- Global defaults in `build.yaml` (e.g. `field_rename: snake`, `explicit_to_json: true`, `checked: true`).
- Enums: `@JsonEnum` with an `unknown` fallback so a new backend value never crashes the app.
- Money: confirm with the backend whether amounts are minor units (int) — prefer `int` minor units over `double` in entities. `TODO(backend)`.
- Nullable fields only when the API genuinely omits them; provide `@JsonKey(defaultValue: …)` where sensible.

### 🔁 Code generation reminder (mandatory)

Whenever an agent **creates or modifies** any class annotated with `@JsonSerializable`, `@JsonEnum`,
`@freezed`, or `@injectable`/`@LazySingleton`, it must end its response with:

> **Run code generation:** `dart run build_runner build --delete-conflicting-outputs`
> (or `dart run build_runner watch --delete-conflicting-outputs` while developing)

Generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) are committed — `TODO(team)`: confirm; if not committed, add them to `.gitignore` and CI must run build_runner.

## 2. Data sources

```dart
abstract interface class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
}

@LazySingleton(as: OrderRemoteDataSource)
final class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  const OrderRemoteDataSourceImpl(this._client);
  final ApiClient _client;

  @override
  Future<List<OrderModel>> fetchOrders() async {
    final json = await _client.get<List<dynamic>>(ApiEndpoints.orders);
    return json.map((e) => OrderModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
```

- Remote data sources use the shared `ApiClient` (Dio wrapper in `core/network/`) — never create a `Dio()` inside a feature.
- Data sources **throw** typed `AppException`s (the `ApiClient` interceptor converts `DioException` → `AppException`).
- Local data sources wrap `shared_preferences` / `flutter_secure_storage` / a DB via `core/storage/`. Tokens & PII → secure storage only.

## 3. Repository implementations

- Implement the **domain** contract; return `Result<T>`; **never throw** to the domain/presentation layers.
- Catch `AppException` → map to `Failure` via the shared mapper (`07_ERROR_HANDLING.md`).
- Map models → entities here.
- Caching strategy (if any) lives here, not in the Bloc.

```dart
@LazySingleton(as: OrderRepository)
final class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl(this._remote);
  final OrderRemoteDataSource _remote;

  @override
  Future<Result<List<Order>>> getOrders() => guard(() async {
        final models = await _remote.fetchOrders();
        return models.map((m) => m.toEntity()).toList();
      });
}
```

`guard` (in `core/error/`) wraps the call, catches `AppException`, and returns `Success` or `Err(Failure)`.

## 4. Networking basics

- Base URL, timeouts, and flavours come from `--dart-define` / flavor config — never hard-coded.
- Interceptors: auth header, token refresh, logging (debug only), error mapping.
- Endpoints as constants in `core/network/api_endpoints.dart`.

## 5. Tests (write first)

- Model: `fromJson` with a fixture in `test/fixtures/*.json`, `toJson` round-trip, unknown enum fallback.
- Repository: success maps to entities; each exception type maps to the right `Failure`.
- Data source: mocked `ApiClient`, verifies endpoint & parsing.
