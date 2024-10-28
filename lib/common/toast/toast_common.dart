import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:oktoast/oktoast.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@Injectable()
class ToastCommon {
  static void showDIToast(String content) {
    showToast(content,
        textStyle: TextStyles.w700Size14White1,
        textAlign: TextAlign.start,
        position: ToastPosition.bottom,
        backgroundColor: AppColors.black2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        radius: 26,
        textPadding: const EdgeInsets.all(10));
  }

  static void showDIToastWidget(String content) {
    showToastWidget(
      ClipRRect(
        child: Container(
          height: 32.h,
          width: 114,
          padding: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: AppColors.black2,
            borderRadius: BorderRadius.circular(26)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZPIcon(Ics.icCheckCircle, width: 30.w, height: 30.h,),
              SizedBox(width: 4.w,),
              ZPText(keyText: content, style: TextStyles.w700Size14White1, textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
      position: ToastPosition.top,
    );
  }

  static void showDIErrorToast(String content) {
    showToast(content,
        textStyle: TextStyles.w400Black11,
        textAlign: TextAlign.start,
        position: const ToastPosition(align: Alignment.bottomCenter, offset: -80.0),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        radius: 6,
        duration:const Duration(seconds: 10),
        textPadding: const EdgeInsets.all(10));
  }

}
