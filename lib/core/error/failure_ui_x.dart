import 'package:rayyan_driver/core/error/failure.dart';
import 'package:rayyan_driver/core/l10n/generated/app_localizations.dart';

/// Localized copy for a [Failure]. Failures themselves carry no UI strings.
extension FailureUiX on Failure {
  /// Short headline for error views.
  String toTitle(AppLocalizations l10n) => switch (this) {
    NetworkFailure() => l10n.errorNetworkTitle,
    _ => l10n.errorGenericTitle,
  };

  /// Body copy for error views.
  String toMessage(AppLocalizations l10n) => switch (this) {
    NetworkFailure() => l10n.errorNetworkMessage,
    ServerFailure() => l10n.errorServerMessage,
    UnauthorizedFailure() => l10n.errorUnauthorizedMessage,
    ValidationFailure() => l10n.errorValidationMessage,
    CacheFailure() || UnexpectedFailure() => l10n.errorUnexpectedMessage,
  };

  /// Whether a Retry action makes sense.
  bool get isRetryable => switch (this) {
    NetworkFailure() || ServerFailure() || UnexpectedFailure() => true,
    CacheFailure() => true,
    UnauthorizedFailure() || ValidationFailure() => false,
  };
}
