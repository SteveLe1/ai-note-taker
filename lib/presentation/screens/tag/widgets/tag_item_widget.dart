import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/enum/enum.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class TagItemWidget extends StatelessWidget {
  final String tagText;
  final TagColor tagColor;
  final bool isShowBorder;
  final Function()? onPressed;
  final Function()? onClose;

  const TagItemWidget(
      {super.key,
      required this.tagText,
      required this.tagColor,
      this.isShowBorder = false,
      this.onPressed,
      this.onClose});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: isShowBorder ? AppColors.black3 : AppColors.white1,
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
        child: ZPText(
          keyText: tagText,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: !isShowBorder ? AppColors.black3 : AppColors.white1),
        ),
      ),
    );
  }
}
