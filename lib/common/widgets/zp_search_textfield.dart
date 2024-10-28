import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

import 'zp_icon.dart';
import 'zp_textfield.dart';

class ZPSearchTextField extends StatelessWidget {
  const ZPSearchTextField(
      {Key? key, this.onChanged, this.hintText, this.padding, this.readOnly = false, this.focusNode, this.controller, this.suffixIcon})
      : super(key: key);
  final ValueChanged<String>? onChanged;
  final EdgeInsets? padding;
  final String? hintText;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ZPTextField(
      controller: controller,
      readonly: readOnly,
      hintText: hintText ?? LocaleKeys.contact_list_search,
      focusNode: focusNode,
      textStyle: TextStyles.w500Size16Black3,
      hintStyle: TextStyles.w500Size16GreySearch,
      fillColor: AppColors.greyTextField,
      borderColor: AppColors.greyTextField,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      prefixIcon: InkWell(
        onTap: () {},
        child: const Padding(
            padding: EdgeInsets.all(6),
            child: ZPIcon(
              Ics.icSearch,
              color: AppColors.greySearch,
              width: 30,
              height: 30,
            )),
      ),
      suffixIcon: suffixIcon,
      onChanged: onChanged,
    );
  }
}
