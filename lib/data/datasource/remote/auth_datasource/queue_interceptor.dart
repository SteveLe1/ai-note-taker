// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:coconut_note/common/toast/toast_common.dart';
import 'package:coconut_note/data/datasource/local/secure_storage.dart';
import 'package:coconut_note/domain/models/requests/refresh_token/refresh_token_request.dart';
import 'package:coconut_note/domain/models/responses/access_token_expire_model/access_token_expire_model.dart';
import 'package:coconut_note/domain/models/responses/error_model/zp_base_error_model.dart';
import 'package:coconut_note/domain/models/responses/refresh_token/refresh_token_response.dart';
import 'package:coconut_note/utils/constants/strings.dart';

bool showPopUpNoConnection = false;

@Injectable()
class QueueInterceptor extends QueuedInterceptor {
  final SecureStorage _secureStorage;
  final Dio dio;

  QueueInterceptor(this.dio, this._secureStorage);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (showPopUpNoConnection) {
      return handler.reject(err);
    }

    if (!showPopUpNoConnection && err.error is SocketException) {
      showPopUpNoConnection = true;
      ToastCommon.showDIToast("Connect to network");
      showPopUpNoConnection = false;
      return handler.reject(err);
    }

    final statusCode = err.response?.statusCode;
    log("### StatusCode : $statusCode");
    log("### Error : ${err.response?.statusMessage}");

    if (statusCode == 400) {
      return handler.reject(err);
    } else if (err.response?.statusCode == 401) {
      debugPrint("${err.response!.data}");
      final model = AccessTokenExpireModel.fromJson(err.response!.data);

      /// Token expired
      if (model.info?.message?.toLowerCase().contains('jwt'.toLowerCase()) ?? false) {
        return _refreshToken(err, handler);
      }

      /// No token provide
      if (model.info?.message?.toLowerCase().contains('No auth token'.toLowerCase()) ?? false) {
        return handler.next(err);
      }
    } else if (statusCode == 403) {
      await Future.wait([
        _secureStorage.setAccessToken(""),
        _secureStorage.setRefreshToken(""),
      ]);
      return handler.reject(err);
    } else if (statusCode == 404) {
      return handler.next(err);
    } else if (statusCode == 502 || statusCode == 504) {
      showPopUpNoConnection = false;
      return handler.reject(err);
    }
    return handler.next(err);
  }

  Future<void> _refreshToken(DioError err, ErrorInterceptorHandler handler) async {
    final refreshToken = await _secureStorage.getRefreshToken();
    final accessToken = await _secureStorage.getAccessToken();
    if (refreshToken != null) {
      try {
        final result = await dio.post(
          '${Const.baseApi}api/v1/auth/refresh-access-token',
          data: RefreshTokenRequest(refreshToken: refreshToken, accessToken: accessToken!).toJson(),
        );
        final RefreshTokenResponse res = RefreshTokenResponse.fromJson(result.data!);
        await Future.wait([
          _secureStorage.setAccessToken(res.data.accessToken),
          _secureStorage.setRefreshToken(res.data.refreshToken),
        ]);
        log('### new tokens ${res.data.accessToken}\n${res.data.refreshToken}');
        return retry(err, handler, res.data.accessToken);
      } catch (e) {
        return refreshTokenExpire(err, handler);
      }
    }
    return handler.next(err);
  }

  Future<void> retry(DioError err, ErrorInterceptorHandler handler, String accessToken) async {
    final requestOptions = err.requestOptions;
    requestOptions.headers["Authorization"] = 'Bearer $accessToken';
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    try {
      final cloneReq = await dio.request<dynamic>(
        requestOptions.baseUrl + requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      return handler.resolve(cloneReq);
    } catch (e) {
      if (e is DioError) {
        return _refreshToken(e, handler);
      }
      return handler.next(err);
    }
  }

  Future<void> refreshTokenExpire(DioError e, ErrorInterceptorHandler handler) async {
    return handler.next(e);
  }
}
