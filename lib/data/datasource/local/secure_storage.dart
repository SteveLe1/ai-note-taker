import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_storage_datasource.dart';

@Singleton()
class SecureStorage {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  SecureStorage(this._secureStorage, this._sharedPreferences) {
    final firstInstall = _sharedPreferences.getBool(StorageKeys.firstInstall);
    if (firstInstall ?? true) {
      _secureStorage.deleteAll();
      _sharedPreferences.setBool(StorageKeys.firstInstall, true);
    }
  }

  Future<bool> isFirstOpenApp() async {
    final checkFirstOpenApp =
        _sharedPreferences.getBool(StorageKeys.firstInstall);
    if (checkFirstOpenApp == null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> checkAccountLoginApp() async {
    final String? checkFirstOpenApp =
        await _secureStorage.read(key: StorageKeys.firstOpenKey);
    return checkFirstOpenApp ?? '';
  }

  Future<void> makeFirstOpen(String account) async {
    final String? checkFirstOpenApp =
        await _secureStorage.read(key: StorageKeys.firstOpenKey);
    if (checkFirstOpenApp == null) {
      await _secureStorage.write(key: StorageKeys.firstOpenKey, value: account);
    } else {
      await _secureStorage.write(
          key: StorageKeys.firstOpenKey, value: checkFirstOpenApp + account);
    }
  }

  Future<String?> getAccessToken()  async {
    return  _sharedPreferences.getString(StorageKeys.accessTokenKey);
  }

  Future<void> setAccessToken(String token) =>
      _sharedPreferences.setString(StorageKeys.accessTokenKey, token);


  Future<String?> getSignUpInfo() =>
      _secureStorage.read(key: StorageKeys.isSignUpInfo);

  Future<void> setSignUpInfo(bool isSignUpInfo) => _secureStorage.write(
      key: StorageKeys.isSignUpInfo, value: isSignUpInfo.toString());

  Future<void> saveMessage({required String saveMessage}) =>
      _secureStorage.write(key: StorageKeys.saveMessage, value: saveMessage);

  Future<String?> readMessage() =>
      _secureStorage.read(key: StorageKeys.saveMessage);

  Future<String?> getRefreshToken() =>
      _secureStorage.read(key: StorageKeys.refreshToken);

  Future<void> setRefreshToken(String token) =>
      _secureStorage.write(key: StorageKeys.refreshToken, value: token);

  Future<void> logOut() {
    return Future.wait([
      _secureStorage.delete(key: StorageKeys.accessTokenKey),
      _secureStorage.delete(key: StorageKeys.refreshToken),
    ]);
  }
}
