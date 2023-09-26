import 'package:either_dart/either.dart';
import 'package:mvvm_shop/data/model/requests_model.dart';
import 'package:mvvm_shop/data/model/responses.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/responses/responses.dart';

abstract class Repository {
  Future<Either<Failure, ApiMessage>> login(LoginRequest loginRequest);
  Future<Either<Failure, ApiMessage>> emailSubmit(EmailRequest emailRequest);
  Future<Either<Failure, ApiMessage>> codeSubmit(CodeRequest codeRequest);
  Future<Either<Failure, SignUpDomainRes>> signUp(SignUpRequest signUpRequest);
  Future<Either<Failure, UserProfileRes>> postUserData(
      String userId, UserProfileRequest userProfileRequest);
}
