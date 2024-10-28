import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class ZPText extends Text {
   ZPText({
    required String keyText,
    String suffix = '',
    String prefix = '',
    Map<String, String>? namedArgs,
    TextStyle? style,
    TextAlign? textAlign,
    Key? key,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
  }) : super(prefix + keyText.tr(namedArgs: namedArgs) + suffix,
            style: style ?? TextStyles.textBasic15,
            textAlign: textAlign,
            maxLines: maxLines,
            key: key,
            overflow: overflow,
            softWrap: softWrap);
}
