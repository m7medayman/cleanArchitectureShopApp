// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestBody _$UserRequestBodyFromJson(Map<String, dynamic> json) =>
    UserRequestBody(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      imageUrl: json['imageUrl'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserRequestBodyToJson(UserRequestBody instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'phone': instance.phone,
    };
