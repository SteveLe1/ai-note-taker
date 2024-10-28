import 'dart:ui';

import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

enum MessageType { error, success }

enum Order { asc, desc }

enum StateStatus { initial, loading, success, failure }

enum Trend {
  theSame("the_same"),
  trendingUp("trending_up"),
  trendingDown("trending_down");

  final String name;

  const Trend(this.name);
}

enum StringCase {
  upperCase,
  lowerCaseCase,
  camelCase,
  pascalCase,
  snakeCase,
  titleCase,
}

enum EnumPersonality {
  whatever("무던무던", Ics.icWhatever),
  friendly("친절한", Ics.icFriendly),
  trustworthy("믿을만한", Ics.icTrustworthy),
  snaky("능글능글", Ics.icSnaky),
  timid("소심이", Ics.icTimid),
  certain("똑부러지는", Ics.icCertain),
  overbearing("심한허세", Ics.icOverbearing),
  idiot("멍충이", Ics.icIdiot),
  headstrong("고집불통", Ics.icHeadstrong),
  fiery("불같은", Ics.icFiery),
  boomer("꼰대", Ics.icBoomer),
  dog("DOG", Ics.icDog),
  unspecified("미지정", Ics.icUnspecified);

  final String name;
  final String pathIcon;

  const EnumPersonality(this.name, this.pathIcon);
}

enum TagColor {
  zippy10("zippy10", AppColors.zippy10, AppColors.brightZippy10),
  zippy2("zippy2", AppColors.zippy2, AppColors.brightZippy2),
  zippy3("zippy3", AppColors.zippy3, AppColors.brightZippy3);

  final String key;
  final Color mainColor;
  final Color backgroundColor;

  const TagColor(this.key, this.mainColor, this.backgroundColor);
}
