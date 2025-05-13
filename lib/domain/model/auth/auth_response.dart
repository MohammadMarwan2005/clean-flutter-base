import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String message;
  final SuccessAuthData data;

  AuthResponse({
    required this.message,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class SuccessAuthData {
  final String token;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "role_id")
  final int roleId;

  SuccessAuthData({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.roleId,
  });

  factory SuccessAuthData.fromJson(Map<String, dynamic> json) =>
      _$SuccessAuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessAuthDataToJson(this);
}
