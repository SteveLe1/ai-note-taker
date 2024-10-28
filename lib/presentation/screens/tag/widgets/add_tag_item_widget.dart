import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class AddTagItemWidget extends StatelessWidget {
  final String? tagText;
  final VoidCallback? onPressed;

  const AddTagItemWidget({super.key, this.tagText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white1, borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.white4)
        ),
        margin: EdgeInsets.only(left: 10.0.w, bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 6.0.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ZPIcon(Ics.icPlus, width: 16.w, height: 16.h, color: AppColors.grey1,),
            SizedBox(width: 4.w,),
            ZPText(
              keyText: tagText ?? "콜백 안함",
              style: TextStyles.w500Size13Grey1,
            ),
          ],
        ),
      ),
    );
  }
}
