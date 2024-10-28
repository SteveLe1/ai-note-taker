import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_list_tile.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({super.key, required this.icon, required this.textTitle, this.iconColor, this.onPressed, this.isShowTrailing = true});
  final String icon;
  final Color? iconColor;
  final String textTitle;
  final VoidCallback? onPressed;
  final bool isShowTrailing;

  @override
  Widget build(BuildContext context) {
    return ZPListTile(
      isDividerShow: false,
      padding: EdgeInsets.symmetric(vertical: 11.h),
      iconLeading: icon,
      iconLeadingColor: iconColor,
      iconLeadingSize: 28,
      text: textTitle,
      textStyle: TextStyles.w400Size15Black1,
      trailing: isShowTrailing ? ZPIcon(Ics.icArrowRight, color: AppColors.grey1, width: 30.w, height: 30.h,) : const SizedBox(),
      onPressed: onPressed,
    );
  }
}