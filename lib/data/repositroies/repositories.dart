import 'package:either_dart/src/either.dart';
import 'package:mvvm_shop/data/data_source/local_data_source.dart';
import 'package:mvvm_shop/data/data_source/remote_data_source.dart';
import 'package:mvvm_shop/data/mappers/mappers.dart';
import 'package:mvvm_shop/data/to_domain_model/requests_model.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/network/error_hadler.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/data/network/network_info.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';

class RepositoryImp implements Repository {
  final Network _networkInfo;
  final RemoteData _remoteDataSource;
  final LocalDataSource _localDataSource;
  RepositoryImp(
      this._networkInfo, this._remoteDataSource, this._localDataSource);
  @override
  Future<Either<Failure, DomainApiMessage>> login(
      LoginRequest loginRequest) async {
    return executeApiRequest(loginRequest, _remoteDataSource.login);
  }

  @override
  Future<Either<Failure, DomainApiMessage>> codeSubmit(
      CodeRequest codeRequest) async {
    Either<Failure, DomainApiResponse> apiResponse =
        await _apiRequest(_remoteDataSource.codeSubmit(codeRequest));
    return apiResponse.map((response) => response as DomainApiMessage);
  }

  @override
  Future<Either<Failure, DomainApiMessage>> emailSubmit(
      EmailRequest emailRequest) async {
    Either<Failure, DomainApiResponse> apiResponse =
        await _apiRequest(_remoteDataSource.emailSubmit(emailRequest));
    return apiResponse.map((response) => response as DomainApiMessage);
  }

  Future<Either<Failure, DomainApiMessage>> _apiRequest(Future request) async {
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
  Future<Either<Failure, DomainSignUpDomainRes>> signUp(
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

  @override
  Future<Either<Failure, DomainBunchOfServicesRes>> fetchServicesData() async {
    try {
      DomainBunchOfServicesRes response = _localDataSource.getHomeData();
      return Right(response);
    } catch (e) {
      if (await _networkInfo.isConnected()) {
        try {
          var response = await _remoteDataSource.fetchServicesData();
          print(response.servicesRes);
          _localDataSource
              .saveHomeData(BunchOfServicesResMapper(response).toDomain());
          return Right(BunchOfServicesResMapper(response).toDomain());
        } catch (e) {
          return Left(Failure(6, e.toString()));
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, DomainDetailsRes>> fetchDetailsData(String id) async {
    if (await _networkInfo.isConnected()) {
      try {
        var response = await _remoteDataSource.fetchDetailsData(id);
        print(response);
        return Right(DetailsResMapper(response).toDomain());
      } catch (e) {
        return Left(Failure(6, e.toString()));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
