import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class PermissionSettingItemWidget extends StatelessWidget {
  String icon;
  String permission;
  String description;
  ZPText rule;
  PermissionSettingItemWidget({super.key, required this.icon, required this.permission, required this.description, required this.rule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h, left: 25.w, right: 26.w),
      child: Row(
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.grey6,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: ZPIcon(icon, width: 25.w, height: 30.h,)
              )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 25.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(child: ZPText(keyText: permission, style: TextStyles.w600Size15Black5,)),
                      SizedBox(width: 5.w,),
                      Flexible(child: rule)
                    ],
                  ),
                  ZPText(keyText: description, style: TextStyles.w400Size12Black8,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
