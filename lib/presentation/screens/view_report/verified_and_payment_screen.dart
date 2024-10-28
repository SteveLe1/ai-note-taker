import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
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
class VerifiedAndPaymentScreen extends StatefulWidget {
  const VerifiedAndPaymentScreen({super.key});

  @override
  State<VerifiedAndPaymentScreen> createState() => _VerifiedAndPaymentScreenState();
}

class _VerifiedAndPaymentScreenState extends State<VerifiedAndPaymentScreen> {
  String people = "37";

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
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 40.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ZPText(
                          keyText: LocaleKeys.verified_and_payment_verification_completed,
                          style: TextStyles.w700Size22White1,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 109.w),
                    child: RichText(
                        strutStyle: const StrutStyle(fontFamily: "Pretendard"),
                        text: TextSpan(style: DefaultTextStyle.of(context).style, children: <TextSpan>[
                          TextSpan(
                              text: LocaleKeys.verified_and_payment_description_1.tr(),
                              style: TextStyles.w500Size17White4),
                          TextSpan(
                              text: LocaleKeys.verified_and_payment_people.tr(args: [people]),
                              style: TextStyles.w500Size17Mint1),
                          TextSpan(
                              text: LocaleKeys.verified_and_payment_description_2.tr(),
                              style: TextStyles.w500Size17White4),
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 103.h, bottom: 20.h),
                    child: ZPIcon(
                      Images.report1,
                      height: 228.h,
                    ),
                  ),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
              child: ZPButton(
                text: LocaleKeys.verified_and_payment_verification_completed,
                textStyle: TextStyles.w600Size16Black3,
                height: 58.h,
                radius: 20,
                onPressed: () {
                  appRouter.push(const ReportRevealRoute());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
