// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://identitytoolkit.googleapis.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SignUpRes> signUp(
    String email,
    String password, {
    dynamic returnSecureToken = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'email': email,
      'password': password,
      'returnSecureToken': returnSecureToken,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SignUpRes>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'accounts:signUp?key=AIzaSyDHcCvtpSzcEjXZtUHi4z46KCLLvxCE8x0',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignUpRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SimpleMessageRes> login(
    String email,
    String password, {
    dynamic returnSecureToken = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'email': email,
      'password': password,
      'returnSecureToken': returnSecureToken,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SimpleMessageRes>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'accounts:signInWithPassword?key=AIzaSyDHcCvtpSzcEjXZtUHi4z46KCLLvxCE8x0',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleMessageRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SimpleMessageRes> emailCheck(String email) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'email': email};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SimpleMessageRes>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customers/email_check',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleMessageRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SimpleMessageRes> codeCheck(String code) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'code': code};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SimpleMessageRes>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customers/code_check',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleMessageRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SimpleMessageRes> passwordReset(String password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'password': password};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SimpleMessageRes>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customers/reset_password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleMessageRes.fromJson(_result.data!);
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
