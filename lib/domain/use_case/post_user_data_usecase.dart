import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/to_domain_model/requests_model.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/base_use_case.dart';

class PostUserDataUseCase
    extends BaseUseCase<PostDataUseCaseInput, UserProfileRes> {
  final Repository _repository;
  PostUserDataUseCase(this._repository);
  @override
  Future<Either<Failure, UserProfileRes>> execute(PostDataUseCaseInput input) {
    return _repository.postUserData(
        input.userId,
        UserProfileRequest(
            email: input.email,
            userName: input.userName,
            imageUrl: input.imageUrl,
            phone: input.phone));
  }
}

class PostDataUseCaseInput {
  String userId;
  String email;
  String userName;
  String phone;
  String imageUrl;
  PostDataUseCaseInput(
      this.userId, this.email, this.imageUrl, this.phone, this.userName);
}
