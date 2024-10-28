
import 'package:coconut_note/utils/constants/strings.dart';

class ValidateUtils {
  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      String pattern = Const.passwordRegex;
      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    }
  }

  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      String pattern = Const.emailRegex;
      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(value.trim());
    }
  }
  static bool validateKoreanPhone(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      String pattern = Const.koreanPhoneRegex;
      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    }
  }
}