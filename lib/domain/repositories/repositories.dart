import 'package:either_dart/either.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, ApiMessage>> emailSubmit(EmailRequest emailRequest);
  Future<Either<Failure, ApiMessage>> codeSubmit(CodeRequest codeRequest);
}
