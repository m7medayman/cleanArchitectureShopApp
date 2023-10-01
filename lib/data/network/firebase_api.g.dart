// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _FireBaseServiceClient implements FireBaseServiceClient {
  _FireBaseServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://firestore.googleapis.com/v1/projects/mvvmshop-21b38/databases/(default)/documents/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserProfileRes> postUserProfile(
    String userId,
    dynamic data,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserProfileRes>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'users/${userId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserProfileRes.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
