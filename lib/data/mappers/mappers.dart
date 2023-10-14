import 'package:mvvm_shop/app/extensions.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/data/responses/responses.dart';

extension ApiMessageMapper on SimpleMessageRes? {
  DomainApiMessage toDomain() {
    return DomainApiMessage(
      idToken: (this?.refreshToken).orEmpty(),
      expiresIn: (this?.expiresIn).orEmpty(),
      refreshToken: (this?.refreshToken).orEmpty(),
    );
  }
}

extension SignUpResMapper on SignUpRes? {
  DomainSignUpDomainRes toDomain() {
    return DomainSignUpDomainRes(
        email: (this?.email).orEmpty(),
        idToken: (this?.idToken).orEmpty(),
        expiresIn: (this?.expiresIn).orEmpty(),
        localId: (this?.localId).orEmpty(),
        refreshToken: (this?.refreshToken).orEmpty());
  }
}

abstract class Mapper<I, O> {
  O toDomain();
}

class SimpleMessageMapper
    implements Mapper<SimpleMessageRes?, DomainApiMessage> {
  SimpleMessageRes? input;
  SimpleMessageMapper({
    this.input,
  });
  @override
  DomainApiMessage toDomain() {
    return DomainApiMessage(
        expiresIn: (input?.expiresIn).orEmpty(),
        idToken: (input?.idToken).orEmpty(),
        refreshToken: (input?.refreshToken).orEmpty());
  }
}

class DetailsResMapper implements Mapper<DetailsRes, DomainDetailsRes> {
  DetailsRes input;
  DetailsResMapper(this.input);
  @override
  DomainDetailsRes toDomain() {
    return DomainDetailsRes(
        imageUrl: input.imageUrl.orEmpty(),
        details: input.details.orEmpty(),
        aboutStore: input.aboutStore.orEmpty(),
        services: input.services.orEmpty());
  }
}

class BunchOfServicesResMapper
    implements Mapper<BunchOfServicesRes, DomainBunchOfServicesRes> {
  BunchOfServicesRes? input;
  BunchOfServicesResMapper(this.input);
  @override
  DomainBunchOfServicesRes toDomain() {
    return DomainBunchOfServicesRes(input?.servicesRes ?? []);
  }
}

dynamic toDomainGeneral(dynamic apiResponse) {
  if (apiResponse is SimpleMessageRes?) {
    return SimpleMessageMapper(input: apiResponse).toDomain();
  }
}
