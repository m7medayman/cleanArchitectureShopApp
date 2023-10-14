import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/to_domain_model/requests_model.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';

import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';

class EmailSubmitUseCase
    implements BaseUseCase<EmailSubmitUseCaseInput, DomainApiMessage> {
  final Repository _repository;
  EmailSubmitUseCase(this._repository);
  @override
  Future<Either<Failure, DomainApiMessage>> execute(
      EmailSubmitUseCaseInput input) async {
    return await _repository.emailSubmit(EmailRequest(input.email));
  }
}

class EmailSubmitUseCaseInput {
  String email;
  EmailSubmitUseCaseInput(this.email);
}

class CodeSubmitUseCase
    implements BaseUseCase<CodeSubmitUseCaseInput, DomainApiMessage> {
  Repository repository;
  CodeSubmitUseCase(this.repository);
  @override
  Future<Either<Failure, DomainApiMessage>> execute(
      CodeSubmitUseCaseInput input) async {
    return await repository.codeSubmit(CodeRequest(input.code));
  }
}

class CodeSubmitUseCaseInput {
  String code;
  CodeSubmitUseCaseInput(this.code);
}
