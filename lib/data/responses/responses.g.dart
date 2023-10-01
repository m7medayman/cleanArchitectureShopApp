// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) =>
    BasicResponse()
      ..error = json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>)
      ..idToken = json['idToken'] as String?
      ..expiresIn = json['expiresIn'] as String?
      ..refreshToken = json['refreshToken'] as String?;

Map<String, dynamic> _$BasicResponseToJson(BasicResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'idToken': instance.idToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
    };

SimpleMessageRes _$SimpleMessageResFromJson(Map<String, dynamic> json) =>
    SimpleMessageRes()
      ..error = json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>)
      ..idToken = json['idToken'] as String?
      ..expiresIn = json['expiresIn'] as String?
      ..refreshToken = json['refreshToken'] as String?;

Map<String, dynamic> _$SimpleMessageResToJson(SimpleMessageRes instance) =>
    <String, dynamic>{
      'error': instance.error,
      'idToken': instance.idToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
    };

SignUpRes _$SignUpResFromJson(Map<String, dynamic> json) => SignUpRes(
      email: json['email'] as String?,
      localId: json['localId'] as String?,
    )
      ..error = json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>)
      ..idToken = json['idToken'] as String?
      ..expiresIn = json['expiresIn'] as String?
      ..refreshToken = json['refreshToken'] as String?;

Map<String, dynamic> _$SignUpResToJson(SignUpRes instance) => <String, dynamic>{
      'error': instance.error,
      'idToken': instance.idToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
      'localId': instance.localId,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) =>
    Error()..error = json['error'] as Map<String, dynamic>?;

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'error': instance.error,
    };

UserProfileRes _$UserProfileResFromJson(Map<String, dynamic> json) =>
    UserProfileRes(
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
      createTime: json['createTime'] as String?,
      updateTime: json['updateTime'] as String?,
    );

Map<String, dynamic> _$UserProfileResToJson(UserProfileRes instance) =>
    <String, dynamic>{
      'error': instance.error,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };
