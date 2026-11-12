/// Keys used in local storage. Keep every key here to avoid collisions.
abstract final class StorageKeys {
  /// Selected app language code ("en" / "ar").
  static const String languageCode = 'app_language_code';

  /// Auth access token (secure storage only).
  static const String accessToken = 'auth_access_token';

  /// Auth refresh token (secure storage only).
  static const String refreshToken = 'auth_refresh_token';

  /// Recent product search terms (JSON list).
  static const String recentSearches = 'catalog_recent_searches';

  /// Chosen delivery location (secure storage: it is an address).
  static const String deliveryLocation = 'addresses_delivery_location';
}
