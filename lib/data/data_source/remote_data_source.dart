import 'package:mvvm_shop/data/model/requests_model.dart';
import 'package:mvvm_shop/data/network/app_api.dart';
import 'package:mvvm_shop/data/network/firebase_api.dart';
import 'package:mvvm_shop/data/requests/requests_body.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/model/models.dart';

abstract class RemoteData {
  Future<SimpleMessageRes> login(LoginRequest loginRequest);
  Future<SimpleMessageRes> emailSubmit(EmailRequest emailRequest);
  Future<SimpleMessageRes> codeSubmit(CodeRequest codeRequest);
  Future<SignUpRes> signUp(SignUpRequest signInRequest);
  Future<UserProfileRes> postUserData(
      UserProfileRequest userProfileRequest, String userId);
}

class RemoteDataImpl implements RemoteData {
  final AppServiceClient _appServiceClient;
  final FireBaseServiceClient _fireBaseServiceClient;
  RemoteDataImpl(this._appServiceClient, this._fireBaseServiceClient);
  @override
  Future<SimpleMessageRes> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

  @override
  Future<SimpleMessageRes> codeSubmit(CodeRequest codeRequest) {
    return _appServiceClient.codeCheck(codeRequest.code);
  }

  @override
  Future<SimpleMessageRes> emailSubmit(EmailRequest emailRequest) {
    // TODO: implement emailSubmit
    return _appServiceClient.emailCheck(emailRequest.email);
  }

  @override
  Future<SignUpRes> signUp(SignUpRequest signUpRequest) {
    return _appServiceClient.signUp(
        signUpRequest.email, signUpRequest.password);
  }

  @override
  Future<UserProfileRes> postUserData(UserProfileRequest u, String userId) {
    return _fireBaseServiceClient.postUserProfile(
        userId,
        UserRequestBody(
                email: u.email,
                phone: u.phone,
                imageUrl: u.imageUrl,
                userName: u.userName)
            .toJson());
  }
}
