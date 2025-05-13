// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  message: json['message'] as String,
  data: SuccessAuthData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

SuccessAuthData _$SuccessAuthDataFromJson(Map<String, dynamic> json) =>
    SuccessAuthData(
      token: json['token'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      roleId: (json['role_id'] as num).toInt(),
    );

Map<String, dynamic> _$SuccessAuthDataToJson(SuccessAuthData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role_id': instance.roleId,
    };
