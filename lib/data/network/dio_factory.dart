import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/constants.dart';

String contentType = 'Content-Type';
String applicationJson = 'application/json';
String accept = 'Accept';
String language = 'language';

class DioFactory {
  AppPreferences preferences;
  DioFactory({
    required this.preferences,
  });
  getDio() async {
    final Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      language: await preferences.getAppLanguage(),
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl, // replace with your base URL
      headers: headers,
      sendTimeout: AppConstants.apiTimeOut,
      receiveTimeout: AppConstants.apiTimeOut,
      // Set your other configurations here
    );
    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
