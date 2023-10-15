import 'dart:ffi';

import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';

class GetHomeDataUseCase
    implements BaseUseCase<Null, DomainBunchOfServicesRes> {
  Repository repository;
  GetHomeDataUseCase(this.repository);
  @override
  Future<Either<Failure, DomainBunchOfServicesRes>> execute(Null input) async {
    return await repository.fetchServicesData();
  }
}
