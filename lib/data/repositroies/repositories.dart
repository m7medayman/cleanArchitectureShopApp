import 'package:either_dart/src/either.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_shop/data/data_source/remote_data_source.dart';
import 'package:mvvm_shop/data/mappers/mappers.dart';
import 'package:mvvm_shop/data/network/error_hadler.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/network/network_info.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/model/models.dart';

class RepositoryImp implements Repository {
  final Network _networkInfo;
  final RemoteData _remoteDataSource;

  RepositoryImp(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected()) {
      try {
        AuthenticationRes response =
            await _remoteDataSource.login(loginRequest);
        print(response.toDomain());
        return Right(response.toDomain());
      } catch (e) {
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ApiMessage>> codeSubmit(
      CodeRequest codeRequest) async {
    Either<Failure, ApiResponse> apiResponse =
        await _apiRequest(_remoteDataSource.codeSubmit(codeRequest));
    return apiResponse.map((response) => response as ApiMessage);
  }

  @override
  Future<Either<Failure, ApiMessage>> emailSubmit(
      EmailRequest emailRequest) async {
    Either<Failure, ApiResponse> apiResponse =
        await _apiRequest(_remoteDataSource.emailSubmit(emailRequest));
    return apiResponse.map((response) => response as ApiMessage);
  }

  Future<Either<Failure, ApiResponse>> _apiRequest(Future request) async {
    if (await _networkInfo.isConnected()) {
      try {
        final response = await request;
        if (response.status == 0) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(response.status ?? 0, response.message ?? 'error'));
        }
      } catch (e) {
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
