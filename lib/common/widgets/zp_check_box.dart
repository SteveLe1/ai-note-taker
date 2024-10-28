import 'package:flutter/material.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class ZPCheckBox extends Checkbox {
  const ZPCheckBox({
    Key? key,
    required bool value,
    ValueChanged<bool?>? onChanged,
    Color? activeColor,
    Color? checkColor,
    OutlinedBorder? shape,
    BorderSide? side = const BorderSide(color: AppColors.black1, width: 2),
  }) : super(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      checkColor: checkColor,
      shape: shape,
      side: side,
      key: key,
  );
}