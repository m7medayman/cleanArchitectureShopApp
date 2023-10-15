import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/to_domain_model/requests_model.dart';

import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';

class SignUpUseCase
    extends BaseUseCase<SignUpUseCaseInput, DomainSignUpDomainRes> {
  final Repository _repository;
  SignUpUseCase(
    this._repository,
  );
  @override
  Future<Either<Failure, DomainSignUpDomainRes>> execute(
      SignUpUseCaseInput input) async {
    return await _repository.signUp(SignUpRequest(input.email, input.password));
  }
}

class SignUpUseCaseInput {
  String email;
  String password;
  SignUpUseCaseInput(
    this.email,
    this.password,
  );
}
