import 'package:either_dart/either.dart';
import 'package:mvvm_shop/data/to_domain_model/requests_model.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/responses/responses.dart';

abstract class Repository {
  Future<Either<Failure, DomainApiMessage>> login(LoginRequest loginRequest);
  Future<Either<Failure, DomainApiMessage>> emailSubmit(
      EmailRequest emailRequest);
  Future<Either<Failure, DomainApiMessage>> codeSubmit(CodeRequest codeRequest);
  Future<Either<Failure, DomainSignUpDomainRes>> signUp(
      SignUpRequest signUpRequest);
  Future<Either<Failure, UserProfileRes>> postUserData(
      String userId, UserProfileRequest userProfileRequest);
  Future<Either<Failure, DomainBunchOfServicesRes>> fetchServicesData();
  Future<Either<Failure, DomainDetailsRes>> fetchDetailsData(String id);
}
