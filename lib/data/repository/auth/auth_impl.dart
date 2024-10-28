import 'package:dartz/dartz.dart';
import 'package:zippy_flutter/config/failures/failure.dart';
import 'package:zippy_flutter/data/datasource/local/get_storage_datasource.dart';
import 'package:zippy_flutter/data/datasource/local/secure_storage.dart';
import 'package:zippy_flutter/data/datasource/remote/auth_datasource/auth_datasource.dart';
import 'package:zippy_flutter/domain/models/requests/log_in/log_in_request.dart';
import 'package:zippy_flutter/domain/models/responses/log_in_response/log_in_response.dart';

import 'auth_repository.dart';

class AuthImplementation extends IAuthRepository {
  final SecureStorage _secureStorage;
  final AuthDataSource _authDataSource;

  // ignore: unused_field
  final GetStorageDataSource _getStorageDataSource;

  AuthImplementation(this._secureStorage, this._authDataSource, this._getStorageDataSource);

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      await _secureStorage.logOut();
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isFirstOpenApp(String account) async {
    try {
      await _secureStorage.makeFirstOpen(account);
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, LogInResponse>> logIn(LogInRequest logInRequest) async {
    try {
      final result = await _authDataSource.logIn(logInRequest);
      await Future.wait([
        _secureStorage.setAccessToken(result.data.accessToken),
      ]);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
