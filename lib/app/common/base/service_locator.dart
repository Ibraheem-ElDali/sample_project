import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/login/data/datasources/remote_data_source.dart';
import '../../features/login/data/repository/login_repository_impl.dart';
import '../../features/login/domain/repository/login_repository.dart';
import '../../features/login/domain/usecase/login_usecase.dart';
import '../../features/login/presentation/providers/login_provider.dart';
import '../../features/workouts/data/datasources/remote_data_source.dart';
import '../../features/workouts/data/repository/workouts_repository_impl.dart';
import '../../features/workouts/domain/repository/workouts_repository.dart';
import '../../features/workouts/domain/usecase/workouts_usecase.dart';
import '../../features/workouts/presentation/provider/workouts_provider.dart';
import '../cache/cache_service.dart';
import '../cache/cache_service_impl.dart';
import '../http/http_service_impl.dart';
import '../navigation/navigation_service.dart';
import '../navigation/navigation_service_impl.dart';
import '../network/network_service.dart';
import '../network/network_service_impl.dart';
import '../responsive/responsive_service.dart';
import '../responsive/responsive_service_impl.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // general
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true)),
  );
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(sl()));
  sl.registerLazySingleton<Dio>(() => Dio());

  // services
  sl.registerLazySingleton<CacheService>(() => CacheServiceImpl(sl()));
  sl.registerLazySingleton<HttpServiceImpl>(() => HttpServiceImpl());
  sl.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
  sl.registerLazySingleton<ResponsiveService>(() => ResponsiveServiceImpl());

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => WorkoutsUseCase(sl()));

  // repos
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<WorkoutsRepository>(
      () => WorkoutsRepositoryImpl(sl()));

  // DataSources
  sl.registerLazySingleton<WorkoutsRemoteDataSource>(
      () => WorkoutsRemoteDataSource());
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource());

  // providers
  sl.registerLazySingleton<LoginProvider>(() => LoginProvider(sl()));
  sl.registerLazySingleton<WorkoutsProvider>(() => WorkoutsProvider(sl()));
}
