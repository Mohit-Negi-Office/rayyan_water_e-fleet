# 07 · Error Handling — Errors Render in the Widget Tree

## 1. Rule

**Do not use global `SnackBar` overlays (or toasts) for structural API, data, or validation errors.**
Failures flow back into the widget tree as **state** and are rendered by **rich error-state widgets** in
the place where the data would have appeared.

| Situation | Render as |
|---|---|
| Screen failed to load its data | Full-area `AppErrorView` (icon, title, message, Retry) |
| One section/card failed (rest of screen OK) | `AppErrorView.compact` inside that section |
| Form field invalid | `errorText` on the `AppTextField` under the field |
| Form submit rejected by API (e.g. invalid promo code, slot unavailable) | `AppInlineBanner` above the submit button / in the form |
| Pagination "load more" failed | Error tile as last list item with Retry |
| Offline | `AppErrorView` with the offline variant + retry; optional persistent offline banner at top |
| Action failed in a bottom sheet/dialog | Error state inside the sheet/dialog |

Error and empty states already designed in Figma (use these, don't invent new patterns):

| Design state | Where | Render as |
|---|---|---|
| "Incorrect Number" | Login | `errorText` under `PhoneNumberField` |
| "Incorrect OTP" | OTP | `OtpInput` error state + message |
| "This number already exist" | Profile → change mobile | `errorText` |
| "This location is outside our delivery area" | Select Location | `AppConfirmSheet` on Confirm Location, action "Current Location" (as in Figma) |
| "Add QAR 6 more to reach minimum order" | Cart | Info nudge (not an error) above Checkout |
| Empty cart / No Favourites / No Location / No Saved cards | Cart, Favourites, Addresses, Cards | `AppEmptyView` with the Figma illustration |

SnackBars are allowed **only** for transient, non-structural confirmations ("Added to cart", "Address
saved") or an "Undo" affordance — never as the only place an error is shown.

## 2. Error types (`lib/core/error/`)

```dart
// Thrown by data sources (data layer only)
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}
final class NetworkException extends AppException { const NetworkException(super.message); }
final class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode, this.code});
  final int? statusCode;
  final String? code;
}
final class UnauthorizedException extends AppException { const UnauthorizedException(super.message); }
final class ValidationException extends AppException {
  const ValidationException(super.message, {this.fieldErrors = const {}});
  final Map<String, String> fieldErrors;
}
final class CacheException extends AppException { const CacheException(super.message); }
```

```dart
// Returned to domain/presentation (never thrown)
sealed class Failure {
  const Failure();
}
final class NetworkFailure extends Failure { const NetworkFailure(); }
final class ServerFailure extends Failure { const ServerFailure({this.code}); final String? code; }
final class UnauthorizedFailure extends Failure { const UnauthorizedFailure(); }
final class ValidationFailure extends Failure {
  const ValidationFailure(this.fieldErrors);
  final Map<String, String> fieldErrors;
}
final class UnexpectedFailure extends Failure { const UnexpectedFailure(); }
```

```dart
// lib/core/error/result.dart
sealed class Result<T> { const Result(); }
final class Success<T> extends Result<T> { const Success(this.value); final T value; }
final class Err<T> extends Result<T> { const Err(this.failure); final Failure failure; }

Future<Result<T>> guard<T>(Future<T> Function() body) async {
  try {
    return Success(await body());
  } on AppException catch (e) {
    return Err(e.toFailure());
  } catch (_) {
    return const Err(UnexpectedFailure());
  }
}
```

Flow: `DataSource throws AppException` → `Repository guard → Result` → `UseCase returns Result` →
`Cubit emits failure state` → `Widget renders AppErrorView`.

## 3. Turning a Failure into UI text

- Failures carry **no user-facing strings**. The presentation layer maps them to localized copy:
  `failure.toMessage(context.l10n)` (extension in `core/error/failure_ui_x.dart`).
- Server `code`s that need specific copy are mapped there too (e.g. `slot_unavailable`).
- Never show raw exception messages, stack traces, or HTTP codes to users.

## 4. Shared error widgets (`core/widgets/states/`)

```dart
AppErrorView(
  failure: failure,
  onRetry: context.read<OrdersCubit>().load,   // Retry is required when the action is retryable
)
AppErrorView.compact(failure: failure, onRetry: …)  // for a section/card
AppInlineBanner.error(message: …)                   // inside forms/sheets
```

Each picks icon/illustration + title + message from the failure type, uses theme tokens only, and
exposes a Retry button with proper semantics.

## 5. Unauthorized / session expiry

`UnauthorizedFailure` is handled centrally: the auth interceptor/`AuthCubit` signs the user out and the
`go_router` redirect sends them to login. Individual screens don't handle it.

## 6. Logging & crash reporting

- Log unexpected errors (with stack trace) to the crash reporter (`TODO(team)`: Crashlytics/Sentry) inside `guard` and `FlutterError.onError` / `PlatformDispatcher.instance.onError`.
- Never log tokens, passwords, card data, phone numbers, or addresses.

## 7. Tests

- Every repository: each `AppException` → expected `Failure`.
- Every Cubit/Bloc: failure state emitted, retry recovers.
- Widget test: failure state renders `AppErrorView` and Retry calls the Cubit; assert **no** `SnackBar` is shown for it.
