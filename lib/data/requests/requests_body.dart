import 'package:json_annotation/json_annotation.dart';

part 'requests_body.g.dart';

@JsonSerializable()
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
  Map<String, dynamic> toJson() => _$UserRequestBodyToJson(this);
}
