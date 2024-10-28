import 'package:coconut_note/utils/enum/enum.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

extension StringExtension on String {

  String countdownTime() {
    final timeOpen = DateTime.fromMillisecondsSinceEpoch(int.parse(this));

    final duration = timeOpen.difference(DateTime.now());
    final hour = (duration.inHours).toString().padLeft(2, '0');
    final minute = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (timeOpen.isBefore(DateTime.now())) {
      return '';
    }
    return '$hour:$minute:$second';
  }

  String checkInTimeFormat() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateTimeParse = DateTime.parse(this);
    final dateTimeCheck = DateTime(dateTimeParse.year, dateTimeParse.month, dateTimeParse.day);
    if(dateTimeCheck == today) {
    return "Today";
    } else if(dateTimeCheck == yesterday) {
    return "Yesterday";
    } else{
    return DateFormat("dd MMM, yyyy").format(dateTimeCheck);
    }
  }

  T toEnum<T>(List<T> values) {
    return values.firstWhere((e) =>
        e.toString().toLowerCase().split(".").last ==
        toLowerCase()); //return null if not found
  }

  String capitalize() {
    return trim()
        .split(RegExp(' +'))
        .map((s) => s[0])
        .take(2)
        .join()
        .toUpperCase();
  }

  String replaceSpecialCharacterPhone() {
    return replaceAll(" ", "")
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
  }

  String get validateValue {
    if (isEmpty) {
      return "Please enter your value ";
    }
    return '';
  }

  String reCase(StringCase? stringCase) {
    final ReCase rc = ReCase(this);
    switch (stringCase) {
      case StringCase.camelCase:
        return rc.camelCase;
      case StringCase.pascalCase:
        return rc.pascalCase;
      case StringCase.snakeCase:
        return rc.snakeCase;
      case StringCase.titleCase:
        return rc.titleCase;
      case StringCase.upperCase:
        return toUpperCase();
      case StringCase.lowerCaseCase:
        return toLowerCase();
      case null:
        return this;
    }
  }

  String get roleMember {
    switch (this) {
      case '1':
        return "Admin and Participant";
      case '2':
        return "Admin and Mentor";
      case '3':
        return "Member and Participant";
      case '4':
        return "Member and Mentor";
      default:
        return this;
    }
  }
}

