import 'package:clean_flutter_base/data/api/api_service.dart';
import 'package:clean_flutter_base/data/api/safe_api_caller.dart';
import 'package:clean_flutter_base/data/repo/auth_repo.dart';
import 'package:clean_flutter_base/presentation/feature/test/test_cubit.dart';
import 'package:clean_flutter_base/presentation/main/main_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

Future<void> di() async {
  const tempToken = "ljdf;askj";
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tempToken'
      },
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  });

  // common
  getIt.registerLazySingleton<APIService>(() => APIService(getIt()));
  getIt.registerLazySingleton<SafeAPICaller>(() => SafeAPICaller());

  // repos:
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt(), getIt()));


  // cubits:
  getIt.registerFactory<MainCubit>(() => MainCubit());
  getIt.registerFactory<TestCubit>(() => TestCubit(getIt()));
}
