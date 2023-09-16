import 'package:mvvm_shop/data/network/app_api.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/model/models.dart';

abstract class RemoteData {
  Future<AuthenticationRes> login(LoginRequest loginRequest);
  Future<SimpleMessageRes> emailSubmit(EmailRequest emailRequest);
  Future<SimpleMessageRes> codeSubmit(CodeRequest codeRequest);
}

class RemoteDataImpl implements RemoteData {
  final AppServiceClient _appServiceClient;
  RemoteDataImpl(this._appServiceClient);
  @override
  Future<AuthenticationRes> login(LoginRequest loginRequest) {
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
}
