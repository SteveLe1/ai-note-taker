class Const {
  static const int one = 1;
  static const int two = 2;
  static const int three = 3;
  static const int four = 4;

  static const int passcodeLength = 6;

  static const int decimalMaxLength = 7;

  static const double tokenEarnMaxPerDay = 800;

  static const double limitAmountInput = 99999999;
  static const String baseApi = 'https://zippy-api.sotatek.works';

  Const._();

  static Const get I => _instance;

  static final Const _instance = Const._();

  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String phoneRegex = r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[235-8]\d{2}|4(?:0\d|1[0-2]|9\d))|9[0-35-9]\d{2}|66\d{2})\d{6}$';
  static const String passwordRegex =  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static const String koreanPhoneRegex = r'^(\+?82|0)10\d{8}$';

}