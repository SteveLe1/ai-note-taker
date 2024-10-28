import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

import 'zp_icon.dart';
import 'zp_textfield.dart';

class ZPSearchTextField extends StatelessWidget {
  const ZPSearchTextField(
      {Key? key, this.onChanged, this.hintText, this.padding, this.readOnly = false, this.focusNode, this.controller, this.prefixIcon})
      : super(key: key);
  final ValueChanged<String>? onChanged;
  final EdgeInsets? padding;
  final String? hintText;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ZPTextField(
      controller: controller,
      readonly: readOnly,
      hintText: hintText ?? LocaleKeys.contact_list_search,
      focusNode: focusNode,
      textStyle: TextStyles.w500Size15Black3,
      hintStyle: TextStyles.w500Size15Grey3,
      fillColor: AppColors.white4,
      borderColor: AppColors.white4,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      prefixIcon: prefixIcon,
      suffixIcon: InkWell(
        onTap: () {},
        child: const Padding(
            padding: EdgeInsets.all(12),
            child: ZPIcon(
              Ics.icSearch,
              color: AppColors.grey2,
              width: 30,
              height: 30,
            )),
      ),
      onChanged: onChanged,
    );
  }
}
