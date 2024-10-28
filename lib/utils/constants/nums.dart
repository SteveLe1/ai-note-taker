class ConstNumber {
  static const int limit = 20;

  static const int passcodeLength = 6;

  static const int decimalMaxLength = 7;

  static const double tokenEarnMaxPerDay = 800;

  static const double limitAmountInput = 99999999;

  ConstNumber._();

  static ConstNumber get I => _instance;

  static final ConstNumber _instance = ConstNumber._();
}
