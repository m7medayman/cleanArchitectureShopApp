import 'package:dio/dio.dart';
import 'package:mvvm_shop/app/constants.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:retrofit/http.dart';

part 'firebase_api.g.dart';

@RestApi(baseUrl: AppConstants.fireStore)
abstract class FireBaseServiceClient {
  factory FireBaseServiceClient(Dio dio, {String baseUrl}) =
      _FireBaseServiceClient;
  @POST("users/{userId}?key=${AppConstants.apiKey}")
  Future<UserProfileRes> postUserProfile(
      @Path("userId") String userId, @Body() Map<String, dynamic> data);
}
