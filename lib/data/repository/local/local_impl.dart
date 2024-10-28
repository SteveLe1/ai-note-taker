import 'package:zippy_flutter/data/datasource/local/secure_storage.dart';
import 'package:zippy_flutter/data/repository/local/local_repository.dart';

class LocalRepositoryImpl extends ILocalRepository {
  final SecureStorage _secureStorage;

  LocalRepositoryImpl(this._secureStorage);

  @override
  Future<String?> getAccessToken() async {
    return await _secureStorage.getAccessToken();
  }

}
