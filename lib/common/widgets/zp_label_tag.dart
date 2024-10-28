import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class ZPLabelTag extends StatelessWidget {
  const ZPLabelTag({super.key, this.color, this.textStyle, required this.textLabel});
  final Color? color;
  final TextStyle? textStyle;
  final String textLabel;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 3.w),
      decoration: BoxDecoration(
        color: color ?? AppColors.lightRed2,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ZPText(keyText: textLabel, style: textStyle ?? TextStyles.w500Size11Red1,),
    );
  }
}
