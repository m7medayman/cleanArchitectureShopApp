import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/data_source/remote_data_source.dart';
import 'package:mvvm_shop/data/mappers/mappers.dart';
import 'package:mvvm_shop/data/model/requests_model.dart';
import 'package:mvvm_shop/data/model/responses.dart';
import 'package:mvvm_shop/data/network/error_hadler.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/network/network_info.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';

class RepositoryImp implements Repository {
  final Network _networkInfo;
  final RemoteData _remoteDataSource;

  RepositoryImp(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, ApiMessage>> login(LoginRequest loginRequest) async {
    return executeApiRequest(loginRequest, _remoteDataSource.login);
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

  Future<Either<Failure, ApiMessage>> _apiRequest(Future request) async {
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

  @override
  Future<Either<Failure, SignUpDomainRes>> signUp(
      SignUpRequest signUpRequest) async {
    if (await _networkInfo.isConnected()) {
      print("!!!!!!!!!");
      try {
        final response = await _remoteDataSource.signUp(signUpRequest);
        if (response.error == null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(response.error!.errorCode, response.error!.errorMessage));
        }
      } catch (e) {
        print(e.toString());
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, T>> executeApiRequest<U, T>(
      U signUpRequest, Function executeFunction) async {
    if (await _networkInfo.isConnected()) {
      try {
        final response = await executeFunction(signUpRequest);
        print(response);
        if (response.error == null) {
          return Right(toDomainGeneral(response));
        } else {
          return Left(
              ErrorHandler.handle(response.error!.errorMessage).failure);
        }
      } catch (e) {
        print(e.toString());
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserProfileRes>> postUserData(
      String userId, UserProfileRequest userProfileRequest) async {
    if (await _networkInfo.isConnected()) {
      try {
        final response =
            await _remoteDataSource.postUserData(userProfileRequest, userId);
        if (response.error == null) {
          return Right(response);
        } else {
          return Left(
              ErrorHandler.handle(response.error!.errorMessage).failure);
        }
      } catch (e) {
        print(e.toString());
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
