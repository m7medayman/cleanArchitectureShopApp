import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/to_domain_model/requests_model.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';

import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, DomainApiMessage> {
  final Repository _repository;
  LoginUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, DomainApiMessage>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
