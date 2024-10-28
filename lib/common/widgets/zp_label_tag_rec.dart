import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class ZPLabelTagRec extends StatelessWidget {
  const ZPLabelTagRec({super.key, this.color, this.textStyle, this.iconLeft, this.iconRes, required this.textLabel});

  final Color? color;
  final TextStyle? textStyle;
  final String textLabel;
  final bool? iconLeft;
  final String? iconRes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 3.w),
      decoration: BoxDecoration(
        color: color ?? AppColors.lightRed2,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconLeft == false
              ? Container(
               alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.only(right: 3.5.w),
                    child: iconRes!.isNotEmpty ? ZPIcon(iconRes!) : const SizedBox(),
                  ),
              )
              : const SizedBox(),
          ZPText(
            keyText: textLabel,
            style: textStyle ?? TextStyles.w500Size11Red1,
          ),
        ],
      ),
    );
  }
}
