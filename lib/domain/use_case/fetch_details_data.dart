import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';

class FetchDetailsDataUseCase implements BaseUseCase<String, DomainDetailsRes> {
  Repository repository;
  FetchDetailsDataUseCase(this.repository);

  @override
  Future<Either<Failure, DomainDetailsRes>> execute(String input) {
    return repository.fetchDetailsData(input);
  }
}
