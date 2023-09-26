import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'requests_body.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRequestBody {
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'imageUrl')
  String? imageUrl;
  @JsonKey(name: 'phone')
  String? phone;
  UserRequestBody({
    this.userName,
    this.email,
    this.imageUrl,
    this.phone,
  });
  factory UserRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UserRequestBodyFromJson(json);
  toJson() {
    Map<String, dynamic> data = {
      'fields': {
        "email": {"stringValue": email}
      }
    };
    return jsonEncode(data);
  }
}
