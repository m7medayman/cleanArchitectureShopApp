import 'package:flutter/material.dart';

class DomainApiResponse {
  String idToken;
  String expiresIn;
  String refreshToken;
  DomainApiResponse({
    required this.idToken,
    required this.expiresIn,
    required this.refreshToken,
  });
}

class DomainApiMessage extends DomainApiResponse {
  DomainApiMessage(
      {required String expiresIn,
      required String idToken,
      required String refreshToken})
      : super(
            expiresIn: expiresIn, idToken: idToken, refreshToken: refreshToken);
}

class DomainSignUpDomainRes extends DomainApiResponse {
  String email;
  String localId;
  DomainSignUpDomainRes(
      {required this.email,
      required this.localId,
      required String expiresIn,
      required String idToken,
      required String refreshToken})
      : super(
            expiresIn: expiresIn, idToken: idToken, refreshToken: refreshToken);
}

class DomainServiceRes {
  String name;
  String imageUrl;
  String id;
  DomainServiceRes(
      {required this.name, required this.imageUrl, required this.id});
}

class DomainBunchOfServicesRes {
  List<DomainServiceRes> servicesRes;
  DomainBunchOfServicesRes(this.servicesRes);
}

class DomainDetailsRes {
  String details;
  String aboutStore;
  String services;
  String imageUrl;

  DomainDetailsRes({
    required this.imageUrl,
    required this.details,
    required this.aboutStore,
    required this.services,
  });
}
