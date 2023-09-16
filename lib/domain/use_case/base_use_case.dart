import 'package:either_dart/either.dart';
import 'package:mvvm_shop/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
