import 'package:json_annotation/json_annotation.dart';

import 'package:mvvm_shop/app/extensions.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';

part 'responses.g.dart';

@JsonSerializable()
class BasicResponse {
  Error? error;
  @JsonKey(name: "idToken")
  String? idToken;
  @JsonKey(name: 'expiresIn')
  String? expiresIn;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;
}

@JsonSerializable()
class SimpleMessageRes extends BasicResponse {
  SimpleMessageRes();

  factory SimpleMessageRes.fromJson(Map<String, dynamic> json) =>
      _$SimpleMessageResFromJson(json);
  Map<String, dynamic> toJson() => _$SimpleMessageResToJson(this);
}

@JsonSerializable()
class SignUpRes extends BasicResponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "localId")
  String? localId;
  SignUpRes({this.email, this.localId});
  factory SignUpRes.fromJson(Map<String, dynamic> json) =>
      _$SignUpResFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "error")
  Map? error;
  get errorMessage =>
      (error == null ? '' : error!["message"] as String).orEmpty();
  get errorCode => (error == null ? '' : error!["code"] as String).orEmpty();
  Error();
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class UserProfileRes {
  Error? error;
  @JsonKey(name: "createTime")
  String? createTime;
  @JsonKey(name: "updateTime")
  String? updateTime;
  UserProfileRes({
    this.error,
    this.createTime,
    this.updateTime,
  });
  factory UserProfileRes.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileResToJson(this);
}

class BunchOfServicesRes {
  List<DomainServiceRes>? servicesRes;
  BunchOfServicesRes(this.servicesRes);
}

class DetailsRes {
  String? details;
  String? aboutStore;
  String? services;
  String? imageUrl;
  DetailsRes({
    this.imageUrl,
    this.details,
    this.aboutStore,
    this.services,
  });
}
