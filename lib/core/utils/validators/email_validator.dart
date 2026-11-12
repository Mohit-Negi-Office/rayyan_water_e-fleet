/// Email format check for profile forms. The server has the final word.
abstract final class EmailValidator {
  static final RegExp _pattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@.]{2,}$');

  /// Whether [value] (trimmed) looks like an email address.
  static bool isValid(String value) => _pattern.hasMatch(value.trim());
}
