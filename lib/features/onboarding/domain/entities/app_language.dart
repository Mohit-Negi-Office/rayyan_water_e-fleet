/// Languages the app supports.
enum AppLanguage {
  english('en'),
  arabic('ar');

  const AppLanguage(this.code);

  /// ISO 639-1 code.
  final String code;

  /// Whether the language is written right-to-left.
  bool get isRtl => this == AppLanguage.arabic;

  /// The language for [code], or null when unsupported.
  static AppLanguage? fromCode(String? code) {
    for (final language in values) {
      if (language.code == code) return language;
    }
    return null;
  }
}
