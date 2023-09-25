import 'package:mvvm_shop/data/requests/requests_body.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_shop/app/constants.dart';

import '../responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("accounts:signUp?key=${AppConstants.apiKey}")
  Future<SignUpRes> signUp(
      @Field("email") String email, @Field("password") String password,
      {@Field("returnSecureToken") returnSecureToken = true});

  @POST("accounts:signInWithPassword?key=${AppConstants.apiKey}")
  Future<SimpleMessageRes> login(
      @Field("email") String email, @Field("password") String password,
      {@Field("returnSecureToken") returnSecureToken = true});
  @POST("customers/email_check")
  Future<SimpleMessageRes> emailCheck(@Field("email") String email);
  @POST("customers/code_check")
  Future<SimpleMessageRes> codeCheck(@Field("code") String code);
  @POST("customers/reset_password")
  Future<SimpleMessageRes> passwordReset(@Field("password") String password);
}
