import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zippy_flutter/data/repository/local/local_impl.dart';
import 'package:zippy_flutter/data/repository/local/local_repository.dart';

import 'data/datasource/local/get_storage_datasource.dart';
import 'data/datasource/local/secure_storage.dart';
import 'data/datasource/remote/auth_datasource/auth_datasource.dart';
import 'data/datasource/remote/auth_datasource/auth_interceptor.dart';
import 'data/datasource/remote/auth_datasource/queue_interceptor.dart';
import 'data/repository/auth/auth_impl.dart';
import 'data/repository/auth/auth_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  GetStorage getStorage = GetStorage();
  const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final SecureStorage secureStorage = SecureStorage(flutterSecureStorage, prefs);
  final GetStorageDataSource getStorageDataSource = GetStorageDataSource(getStorage);
  dio.interceptors.addAll([
    AuthInterceptor(secureStorage, dio),
    QueueInterceptor(dio, secureStorage),
  ]);

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<AuthDataSource>(
    AuthDataSource(locator<Dio>()),
  );

  locator.registerSingleton<IAuthRepository>(
    AuthImplementation(secureStorage, locator<AuthDataSource>(), getStorageDataSource),
  );

  locator.registerSingleton<ILocalRepository>(LocalRepositoryImpl(secureStorage));
}
