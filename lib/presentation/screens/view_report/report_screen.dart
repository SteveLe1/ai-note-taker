import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.black3,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 19.h,
            ),
            Container(
              height: 44.h,
              padding: EdgeInsets.only(bottom: 11.h),
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.grey7, width: 1))),
              child: Row(
                children: [
                  SizedBox(width: 25.w),
                  ZPText(
                    keyText: LocaleKeys.report_title,
                    style: TextStyles.w700Size25White1,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  ZPText(
                    keyText: LocaleKeys.report_description_1,
                    style: TextStyles.w700Size22White1,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 50.h),
                    child: ZPIcon(
                      Images.report1,
                      height: 228.h,
                    ),
                  ),
                  ZPText(
                    keyText: LocaleKeys.report_description_2,
                    style: TextStyles.w700Size17White1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
              child: ZPButton(
                text: LocaleKeys.report_verify_btn,
                textStyle: TextStyles.w600Size16Black3,
                height: 58.h,
                radius: 20,
                onPressed: () {
                  appRouter.push(const PhoneVerificationRoute());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
