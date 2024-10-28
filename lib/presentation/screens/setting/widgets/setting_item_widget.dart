import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({super.key,
    required this.icon,
    required this.textTitle,
    this.textStyle,
    this.iconColor, this.onPressed,
    this.isShowTrailing = true,
    this.isShowDivider = true
  });
  final String icon;
  final Color? iconColor;
  final String textTitle;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final bool isShowTrailing;
  final bool isShowDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTListTile(
          // isDividerShow: false,
          border:  Border(
            bottom: BorderSide(width: 1, color: isShowDivider ? AppColors.white4 : Colors.transparent),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          leading: Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(6.0.w),
            decoration:  const BoxDecoration(
                color: AppColors.lightPurple, shape: BoxShape.circle),
            child: ZPIcon(icon,
              width: 36.w,
              height: 36.h,
              color: iconColor,
            ),
          ),
          text: textTitle,
          textStyle: textStyle ?? TextStyles.w600Size16Black3,
          trailing: isShowTrailing ? ZPIcon(Ics.icArrowRight, color: AppColors.greySearch, width: 30.w, height: 30.h,) : const SizedBox(),
          onPressed: onPressed,
        ),
      ],
    );
  }
}