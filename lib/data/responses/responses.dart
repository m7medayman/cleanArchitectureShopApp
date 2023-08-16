import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BasicResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class ContactsRes {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;

  ContactsRes(this.phone, this.email, this.link);

  // from json
  factory ContactsRes.fromJson(Map<String, dynamic> json) =>
      _$ContactsResFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ContactsResToJson(this);
}

@JsonSerializable()
class CustomerRes {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'numberOfNotifications')
  int? numberOfNotifications;
  CustomerRes(
    this.name,
    this.id,
    this.numberOfNotifications,
  );

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory CustomerRes.fromJson(Map<String, dynamic> json) =>
      _$CustomerResFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CustomerResToJson(this);
}

@JsonSerializable()
class AuthenticationRes extends BasicResponse {
  @JsonKey(name: "customer")
  CustomerRes? customer;
  @JsonKey(name: "contacts")
  ContactsRes? contacts;
  AuthenticationRes({
    this.customer,
    this.contacts,
  });

  // from json
  factory AuthenticationRes.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AuthenticationResToJson(this);
}
