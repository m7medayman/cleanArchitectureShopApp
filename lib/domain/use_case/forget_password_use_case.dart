import 'package:either_dart/src/either.dart';

import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';
import 'package:mvvm_shop/model/models.dart';

class EmailSubmitUseCase
    implements BaseUseCase<EmailSubmitUseCaseInput, ApiMessage> {
  Repository _repository;
  EmailSubmitUseCase(this._repository);
  @override
  Future<Either<Failure, ApiMessage>> execute(
      EmailSubmitUseCaseInput input) async {
    return await _repository.emailSubmit(EmailRequest(input.email));
  }
}

class EmailSubmitUseCaseInput {
  String email;
  EmailSubmitUseCaseInput(this.email);
}

class CodeSubmitUseCase
    implements BaseUseCase<CodeSubmitUseCaseInput, ApiMessage> {
  Repository repository;
  CodeSubmitUseCase(this.repository);
  @override
  Future<Either<Failure, ApiMessage>> execute(
      CodeSubmitUseCaseInput input) async {
    return await repository.codeSubmit(CodeRequest(input.code));
  }
}

class CodeSubmitUseCaseInput {
  String code;
  CodeSubmitUseCaseInput(this.code);
}
