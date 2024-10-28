import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class ReportDetailEmptyWidget extends StatelessWidget {
  const ReportDetailEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, left: 35.w, right: 35.w, bottom: 15.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: AppColors.black2, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child:  ZPIcon(
                Ics.icUnspecified,
                width: 160.w,
                height: 160.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
              child: ZPText(
                keyText: LocaleKeys.report_detail_unspecified,
                style: TextStyles.w700Size26White1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 19.h, left: 20.w, right: 20.w),
              child: ZPText(
                keyText: LocaleKeys.report_detail_your_network_level_not_specified,
                style: TextStyles.w500Size15Grey5,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 70.h),
              child: const Divider(
                thickness: 1,
                height: 1,
                color: AppColors.black5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  height: 33.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  height: 16.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.black4,
                      borderRadius: BorderRadius.circular(5)
                  )
                ),
                ZPIcon(
                  Images.faceEmpty,
                  width: 33.w,
                  height: 33.h,
                ),

              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left:20.w, right: 20.w, top: 15.h, bottom: 30.h),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  height: 16.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.black4,
                      borderRadius: BorderRadius.circular(5)

                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
