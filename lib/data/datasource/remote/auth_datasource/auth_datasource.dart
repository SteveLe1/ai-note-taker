import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zippy_flutter/domain/models/requests/log_in/log_in_request.dart';
import 'package:zippy_flutter/domain/models/responses/log_in_response/log_in_response.dart';
import 'package:zippy_flutter/utils/constants/strings.dart';

part 'auth_datasource.g.dart';

@RestApi(baseUrl: "${Const.baseApi}/api/v1")
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/auth/login')
  Future<LogInResponse> logIn(@Body() LogInRequest logInRequest);

  @POST('/auth/register')
  Future<dynamic> signUp();

  @GET('/auth/about-me')
  Future<dynamic> aboutMe();

}
