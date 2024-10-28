extension NumExtension on num {
  String get formatBalance {
    if (this == 0) {
      return 0.toStringAsFixed(2).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
    } else if (this >= 0.000001) {
      final balance = toDouble();
      int index = balance.toString().indexOf('.');
      if (balance.toString().length - index > 7) {
        index += 7;
      } else {
        index = balance.toString().length;
      }
      return balance.toString().substring(0, index);
    } else {
      return 0.toStringAsFixed(2).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
    }
  }
}
