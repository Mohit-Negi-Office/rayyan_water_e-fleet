import 'dart:convert';

/// Pretty text for one HTTP call: URL, headers and body.
abstract final class ApiDebugLog {
  static String request({
    required String method,
    required String url,
    required Map<dynamic, dynamic> headers,
    required Object? body,
  }) {
    return _frame(
      title: 'API REQUEST',
      lines: [
        '$method $url',
        'Headers:',
        _pretty(_plain(headers)),
        'Body:',
        _pretty(body),
      ],
    );
  }

  static String response({
    required String method,
    required String url,
    required int? statusCode,
    required Map<dynamic, dynamic> headers,
    required Object? body,
  }) {
    return _frame(
      title: 'API RESPONSE',
      lines: [
        '$method $url',
        'Status: ${statusCode ?? 'error'}',
        'Headers:',
        _pretty(_plain(headers)),
        'Body:',
        _pretty(body),
      ],
    );
  }

  static String _frame({required String title, required List<String> lines}) {
    final body = lines
        .expand((line) => line.split('\n'))
        .map((line) => '│ $line');
    return ['┌─ $title', ...body, '└─'].join('\n');
  }

  static Map<String, Object?> _plain(Map<dynamic, dynamic> headers) => {
    for (final entry in headers.entries) entry.key.toString(): entry.value,
  };

  static String _pretty(Object? value) {
    final decoded = _decode(value);
    try {
      return const JsonEncoder.withIndent('  ').convert(decoded);
    } on Object {
      return decoded?.toString() ?? 'null';
    }
  }

  static Object? _decode(Object? value) {
    if (value is! String) return value;
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    try {
      return jsonDecode(trimmed);
    } on FormatException {
      return value;
    }
  }
}
