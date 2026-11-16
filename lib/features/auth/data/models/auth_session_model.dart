import 'package:json_annotation/json_annotation.dart';

part 'auth_session_model.g.dart';

/// `data.session` from a successful OTP verify.
@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class AuthSessionModel {
  const AuthSessionModel({
    required this.sessionId,
    required this.token,
    required this.publicKey,
    required this.refreshToken,
  });

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionModelToJson(this);

  final String sessionId;

  /// Access token sent on later calls.
  final String token;

  /// Server public key, kept for later payload encryption.
  final String publicKey;

  final String refreshToken;
}
