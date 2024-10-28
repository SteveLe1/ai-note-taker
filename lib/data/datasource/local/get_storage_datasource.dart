import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetStorageDataSource {
  final GetStorage _getStorage;

  GetStorageDataSource(this._getStorage) {
    if (_getStorage.read(StorageKeys.derivedIndexKey) == null) {
      _getStorage.write(StorageKeys.derivedIndexKey, 0);
    }
  }
}

class StorageKeys {
  static const String derivedIndexKey = 'derive_index';
  static const String passCodeKey = 'pass_code';
  static const String firstInstall = 'first_install';
  static const String userKey = 'current_user';
  static const String firstOpenKey = 'first_open_key';
  static const String accessTokenKey = 'access_token_key';
  static const String addressContractSpending = 'address_contract_spending';
  static const String saveMessage = 'save_message';
  static const String refreshToken = 'refresh_token';
  static const String accessToken = 'accessToken';
  static const String enableMyCheckInNotifications = 'enableMyCheckInNotifications';
  static const String isNewUser = 'isNewUser';
  static const String indexPageNotificarion = 'indexPageNotificarion';
  static const String firebaseTokenPrefKey = 'firebaseToken';
  static const String isSignUpInfo = 'sign_up_info';
}
