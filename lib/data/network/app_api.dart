import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_shop/app/constants.dart';

import '../responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("customers/login")
  Future<AuthenticationRes> login(
      @Field("email") String email, @Field("password") String password);
  @POST("customers/email_check")
  Future<SimpleMessageRes> emailCheck(@Field("email") String email);
  @POST("customers/code_check")
  Future<SimpleMessageRes> codeCheck(@Field("code") String code);
  @POST("customers/reset_password")
  Future<SimpleMessageRes> passwordReset(@Field("password") String password);
}
