import 'package:mvvm_shop/app/extensions.dart';
import 'package:mvvm_shop/data/model/responses.dart';
import 'package:mvvm_shop/data/responses/responses.dart';

extension ApiMessageMapper on SimpleMessageRes? {
  ApiMessage toDomain() {
    return ApiMessage(
      idToken: (this?.refreshToken).orEmpty(),
      expiresIn: (this?.expiresIn).orEmpty(),
      refreshToken: (this?.refreshToken).orEmpty(),
    );
  }
}

extension SignUpResMapper on SignUpRes? {
  SignUpDomainRes toDomain() {
    return SignUpDomainRes(
        email: (this?.email).orEmpty(),
        idToken: (this?.idToken).orEmpty(),
        expiresIn: (this?.expiresIn).orEmpty(),
        localld: (this?.localld).orEmpty(),
        refreshToken: (this?.refreshToken).orEmpty());
  }
}

abstract class Mapper<I, O> {
  O toDomain();
}

class SimpleMessageMapper implements Mapper<SimpleMessageRes?, ApiMessage> {
  SimpleMessageRes? input;
  SimpleMessageMapper({
    this.input,
  });
  @override
  ApiMessage toDomain() {
    return ApiMessage(
        expiresIn: (input?.expiresIn).orEmpty(),
        idToken: (input?.idToken).orEmpty(),
        refreshToken: (input?.refreshToken).orEmpty());
  }
}

dynamic toDomainGeneral(dynamic apiResponse) {
  if (apiResponse is SimpleMessageRes?) {
    return SimpleMessageMapper(input: apiResponse).toDomain();
  }
}
