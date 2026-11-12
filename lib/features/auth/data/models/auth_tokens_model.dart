import 'package:json_annotation/json_annotation.dart';

part 'auth_tokens_model.g.dart';

/// Response of a correct OTP.
// TODO(backend): confirm the field names.
@JsonSerializable()
class AuthTokensModel {
  const AuthTokensModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokensModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokensModelToJson(this);

  final String accessToken;
  final String refreshToken;
}
