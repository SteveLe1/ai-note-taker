import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class PersonalityItemWidget extends StatelessWidget {
  final String pathIcon;
  final String name;

  const PersonalityItemWidget(
      {super.key, required this.pathIcon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30.0.w, top: 30.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZPIcon(pathIcon, width: 50.0.h, height: 50.0.h),
          SizedBox(height: 6.0.h),
          ZPText(
            keyText: name,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.black5),
          )
        ],
      ),
    );
  }
}
