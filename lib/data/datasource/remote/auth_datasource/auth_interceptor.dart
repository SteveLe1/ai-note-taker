import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:coconut_note/data/datasource/local/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  final Dio dio;

  AuthInterceptor(this._secureStorage, this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await _handleRequestOptions(options);
    super.onRequest(options, handler);
  }

  Future<void> _handleRequestOptions(RequestOptions options) async {
    final token = await _secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['x-api-key'] = 'development';
    options.headers['version'] = '1.1';
    log('### ${options.uri}');
    log('### data ${options.data}');
    log('### accessToken $token');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('### response data ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('### Error $err');
    final error = err.error;
    if (error is SocketException) {
      if (error.osError?.message
              .toLowerCase()
              .contains('no address associated') ??
          false) {}
    }
    super.onError(err, handler);
  }
}
