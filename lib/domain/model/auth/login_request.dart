import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  final String password;
  @JsonKey(name: "fcm_token")
  final String fcmToken;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  LoginRequest({required this.phoneNumber, required this.password, required this.fcmToken});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

}
