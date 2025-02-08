import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:qoute_train/core/api/api_consumer.dart';
import 'package:qoute_train/core/api/app_interceptors.dart';
import 'package:qoute_train/core/api/dio_consumer.dart';
import 'package:qoute_train/core/network/network_info.dart';
import 'package:qoute_train/features/random_quote/data/datasourses/random_quote_local_data_source.dart';
import 'package:qoute_train/features/random_quote/data/datasourses/random_quote_remote_data_source.dart';
import 'package:qoute_train/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:qoute_train/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:qoute_train/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:qoute_train/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:qoute_train/features/splach_screen/data/datasources/lang_local_data_source.dart';
import 'package:qoute_train/features/splach_screen/data/repositories/lang_repository_imp.dart';
import 'package:qoute_train/features/splach_screen/domain/repositories/lang_repository.dart';
import 'package:qoute_train/features/splach_screen/domain/usecases/change_lang.dart';
import 'package:qoute_train/features/splach_screen/domain/usecases/get_saved_lang.dart';
import 'package:qoute_train/features/splach_screen/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  log('init di');

  //! Core
  //* Network
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnection: sl(),
    ),
  );

  //* Api
  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(client: sl()),
  );

  //! Feature

  //* Data Sources
  // random Data Source remote
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );
    // random Data Source local
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  // splash Data Source
  sl.registerLazySingleton<LangLocalDataSource>(
    () => LangLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //* Blocs
  // random Cubit
  sl.registerFactory<RandomQuoteCubit>(
    () => RandomQuoteCubit(
      getRandomQouteUseCase: sl(),
    ),
  );
  // splash Cubit
  sl.registerFactory<LocaleCubit>(
    () => LocaleCubit(
      changeLangUseCases: sl(),
      getSavedLangUseCases: sl(),
    ),
  );

  //* Use Cases
  // random quote use cases
  sl.registerLazySingleton<GetRandomQuote>(
    () => GetRandomQuote(
      quoteRepository: sl(),
    ),
  );

  // splash use cases
  sl.registerLazySingleton<GetSavedLangUseCases>(
    () => GetSavedLangUseCases(
      langRepository: sl(),
    ),
  );
  sl.registerLazySingleton<ChangeLangUseCases>(
    () => ChangeLangUseCases(
      langRepository: sl(),
    ),
  );

  //* Repositories
  // random quote Repository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl(),
    ),
  );
  // splash quote Repository
  sl.registerLazySingleton<LangRepository>(
    () => LangRepositoryImpl(
      langLocalDataSource: sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());

  //* Fix: Register AppIntercepters
  sl.registerLazySingleton<AppIntercepters>(() => AppIntercepters());

  //* Interceptor
  sl.registerLazySingleton(() => const Interceptor());

  //* Log Interceptor
  sl.registerLazySingleton(() => LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));

  log('init end');
}
