import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class TagItemWidget extends StatelessWidget {
  final String tagText;
  final TagColor tagColor;
  final bool isShowBorder;
  final Function()? onClose;

  const TagItemWidget(
      {super.key,
        required this.tagText,
        required this.tagColor,
        this.isShowBorder = false, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              border: isShowBorder
                  ? Border.all(color: tagColor.mainColor, width: 1)
                  : null,
              color: tagColor.backgroundColor,
              borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 6.0.h),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ZPText(
                keyText: tagText,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: tagColor.mainColor),
              ),
              SizedBox(width: 4.w),
              isShowBorder
                  ? InkWell(
                onTap: onClose,
                child: Opacity(
                  opacity: 0.5,
                  child: ZPIcon(Ics.icClose,
                      width: 16.w, height: 16.w, color: AppColors.black1),
                ),
              )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}