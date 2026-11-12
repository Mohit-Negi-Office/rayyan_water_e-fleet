import 'dart:convert';
import 'dart:io';

/// Reads `test/fixtures/<name>` as a JSON object.
Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name').readAsStringSync())
        as Map<String, dynamic>;
