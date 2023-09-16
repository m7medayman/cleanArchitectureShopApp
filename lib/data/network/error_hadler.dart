import 'package:dio/dio.dart';
import 'package:mvvm_shop/app/extensions.dart';
import 'package:mvvm_shop/data/network/failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  static int SUCCESS = 0;
  static int NO_CONTENT = 0;
  static int BAD_REQUEST = 0;
  static int FORBIDDEN = 0;
  static int UNAUTORISED = 0;
  static int NOT_FOUND = 0;
  static int INTERNAL_SERVER_ERROR = 0;
  static int CONNECT_TIMEOUT = 0;
  static int CANCEL = 0;
  static int RECIEVE_TIMEOUT = 0;
  static int SEND_TIMEOUT = 0;
  static int CACHE_ERROR = 0;
  static int NO_INTERNET_CONNECTION = 0;
  static int DEFAULT = 0;
}

class ResponseMessage {
  static String FORBIDDEN = "the request is forbidden ";
  static String SUCCESS = "Success";
  static String NO_CONTENT = "no connect";
  static String BAD_REQUEST = "bad request";
  static String UNAUTORISED = "unauthorised";
  static String NOT_FOUND = "not found ";
  static String INTERNAL_SERVER_ERROR = "internal server error ";
  static String CONNECT_TIMEOUT = "connect timeout";
  static String CANCEL = "cancel";
  static String RECIEVE_TIMEOUT = " recieve timeout ";
  static String SEND_TIMEOUT = "send timeout";
  static String CACHE_ERROR = "cache error ";
  static String NO_INTERNET_CONNECTION = "no internet connection ";
  static String DEFAULT = "default error";
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);

      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

Failure _handleError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.badResponse:
      if (dioError.response != null) {
        return Failure(dioError.response!.statusCode.orZero(),
            dioError.response!.statusMessage.orEmpty());
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    default:
      return DataSource.DEFAULT.getFailure();
  }
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}
