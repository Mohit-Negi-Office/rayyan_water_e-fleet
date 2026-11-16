import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

/// Shared envelope for every user-service response.
///
/// Success carries [data]. Failure carries [error]. The other field is null.
@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class ApiResponseModel {
  const ApiResponseModel({
    required this.code,
    required this.status,
    required this.timestamp,
    this.data,
    this.error,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);

  /// Reads [raw] when it has this envelope. Returns null for any other body.
  static ApiResponseModel? tryFrom(Object? raw) {
    if (raw is! Map<String, dynamic>) return null;
    if (raw['code'] is! num ||
        raw['status'] is! String ||
        raw['timestamp'] is! num) {
      return null;
    }
    try {
      return ApiResponseModel.fromJson(raw);
    } on Object {
      return null;
    }
  }

  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);

  final int code;
  final String status;
  final int timestamp;

  /// Payload of a successful call.
  final Map<String, dynamic>? data;

  /// Present when the call failed.
  final ApiErrorModel? error;

  bool get hasError => error != null;
}

/// `error` object: a type, plus optional detail in [data].
@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class ApiErrorModel {
  const ApiErrorModel({required this.type, this.data});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  final String type;
  final Object? data;
}
