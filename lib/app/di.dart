import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/constants.dart';
import 'package:mvvm_shop/data/data_source/local_data_source.dart';
import 'package:mvvm_shop/data/data_source/remote_data_source.dart';
import 'package:mvvm_shop/data/network/app_api.dart';
import 'package:mvvm_shop/data/network/dio_factory.dart';
import 'package:mvvm_shop/data/network/firebase_api.dart';
import 'package:mvvm_shop/data/network/network_info.dart';
import 'package:mvvm_shop/data/repositroies/repositories.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/fetch_details_data.dart';
import 'package:mvvm_shop/domain/use_case/forget_password_use_case.dart';
import 'package:mvvm_shop/domain/use_case/get_home_data.dart';
import 'package:mvvm_shop/domain/use_case/login_usecase.dart';
import 'package:mvvm_shop/domain/use_case/post_user_data_usecase.dart';
import 'package:mvvm_shop/domain/use_case/signUp_use_case.dart';
import 'package:mvvm_shop/presentation/resources/constant_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt instance = GetIt.instance;
Future<void> initGet() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  // initialize Local Data Source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // initialize Dio Factory
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(preferences: instance<AppPreferences>()));

  // dio for authentication
  Dio dio1 = await instance<DioFactory>().getDio(AppConstants.baseUrl);

  // dio for fireStore
  Dio dio2 = await instance<DioFactory>().getDio(AppConstants.fireStore);
// initialize AppService Client with dio 1
  instance
      .registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio1));

  // initialize fireStore Service Client with dio 2
  instance.registerLazySingleton<FireBaseServiceClient>(
      () => FireBaseServiceClient(dio2));
// initialize fireStore library for data
  instance.registerLazySingleton<DataServiceClient>(() => DataServiceClient());

  instance.registerLazySingleton<RemoteData>(() => RemoteDataImpl(
      instance<AppServiceClient>(),
      instance<FireBaseServiceClient>(),
      instance<DataServiceClient>()));

  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(instance<InternetConnectionChecker>()));

  instance.registerLazySingleton<Repository>(() => RepositoryImp(
      instance<NetworkInfo>(),
      instance<RemoteData>(),
      instance<LocalDataSource>()));
}

bool _isLoginModuleInitialized = false;
Future<void> initLoginModule() async {
  if (!_isLoginModuleInitialized) {
    instance.registerFactory(() => LoginUseCase(instance<Repository>()));
    _isLoginModuleInitialized = true;
  }
}

bool _isEmailSubmittingModuleInitialized = false;
Future<void> initEmailSubmittingModule() async {
  if (!_isEmailSubmittingModuleInitialized) {
    instance.registerFactory(() => EmailSubmitUseCase(instance<Repository>()));
    _isEmailSubmittingModuleInitialized = true;
  }
}

bool _isSignUpModuleInitialized = false;
Future<void> initSignUpModule() async {
  if (!_isSignUpModuleInitialized) {
    instance.registerFactory(() => SignUpUseCase(instance<Repository>()));
    instance.registerFactory(() => PostUserDataUseCase(instance<Repository>()));
    _isSignUpModuleInitialized = true;
  }
}

bool _isHomeDataModuleInitialized = false;
Future<void> initHomeDataModule() async {
  if (!_isHomeDataModuleInitialized) {
    instance.registerFactory(() => GetHomeDataUseCase(instance<Repository>()));
    _isHomeDataModuleInitialized = true;
  }
}

bool _isDetailsDataModuleInitialized = false;
Future<void> initDetailsDataModule() async {
  if (!_isDetailsDataModuleInitialized) {
    instance
        .registerFactory(() => FetchDetailsDataUseCase(instance<Repository>()));
    _isDetailsDataModuleInitialized = true;
  }
}
