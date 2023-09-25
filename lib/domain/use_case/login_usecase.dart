import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/model/requests_model.dart';
import 'package:mvvm_shop/data/model/responses.dart';

import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';
import 'package:mvvm_shop/model/models.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, ApiMessage> {
  final Repository _repository;
  LoginUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, ApiMessage>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
