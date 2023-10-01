import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mvvm_shop/app/app_prefs.dart';
import 'package:mvvm_shop/app/constants.dart';
import 'package:mvvm_shop/data/data_source/remote_data_source.dart';
import 'package:mvvm_shop/data/network/app_api.dart';
import 'package:mvvm_shop/data/network/dio_factory.dart';
import 'package:mvvm_shop/data/network/firebase_api.dart';
import 'package:mvvm_shop/data/network/network_info.dart';
import 'package:mvvm_shop/data/repositroies/repositories.dart';
import 'package:mvvm_shop/domain/repositories/repositories.dart';
import 'package:mvvm_shop/domain/use_case/forget_password_use_case.dart';
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
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(preferences: instance<AppPreferences>()));
  Dio dio1 = await instance<DioFactory>().getDio(AppConstants.baseUrl);
  Dio dio2 = await instance<DioFactory>().getDio(AppConstants.fireStore);
  instance
      .registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio1));
  instance.registerLazySingleton<FireBaseServiceClient>(
      () => FireBaseServiceClient(dio2));
  instance.registerLazySingleton<RemoteData>(() => RemoteDataImpl(
      instance<AppServiceClient>(), instance<FireBaseServiceClient>()));
  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(instance<InternetConnectionChecker>()));
  instance.registerLazySingleton<Repository>(
      () => RepositoryImp(instance<NetworkInfo>(), instance<RemoteData>()));
}

Future<void> initLoginModule() async {
  instance.registerFactory(() => LoginUseCase(instance<Repository>()));
}

Future<void> initEmailSubmittingModule() async {
  instance.registerFactory(() => EmailSubmitUseCase(instance<Repository>()));
}

Future<void> initSignUpModule() async {
  instance.registerFactory(() => SignUpUseCase(instance<Repository>()));
  instance.registerFactory(() => PostUserDataUseCase(instance<Repository>()));
}
