/// Letters shown in place of a missing profile photo ("Mohit Nagi" → "MN").
abstract final class NameInitials {
  static String from(String name) {
    final words = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    if (words.isEmpty) return '';
    if (words.length == 1) return _letter(words.first);
    return '${_letter(words.first)}${_letter(words.last)}';
  }

  static String _letter(String word) {
    final rune = word.runes.first;
    return String.fromCharCode(rune).toUpperCase();
  }
}
