// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) =>
    BasicResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BasicResponseToJson(BasicResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

ContactsRes _$ContactsResFromJson(Map<String, dynamic> json) => ContactsRes(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactsResToJson(ContactsRes instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

CustomerRes _$CustomerResFromJson(Map<String, dynamic> json) => CustomerRes(
      json['name'] as String?,
      json['id'] as int?,
      json['numberOfNotifications'] as int?,
    );

Map<String, dynamic> _$CustomerResToJson(CustomerRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'numberOfNotifications': instance.numberOfNotifications,
    };

AuthenticationRes _$AuthenticationResFromJson(Map<String, dynamic> json) =>
    AuthenticationRes(
      customer: json['customer'] == null
          ? null
          : CustomerRes.fromJson(json['customer'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : ContactsRes.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResToJson(AuthenticationRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
