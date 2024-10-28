import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class ReportRevealScreen extends StatefulWidget {
  const ReportRevealScreen({super.key});

  @override
  State<ReportRevealScreen> createState() => _ReportRevealScreenState();
}

class _ReportRevealScreenState extends State<ReportRevealScreen> {
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
                  const Expanded(child: SizedBox()),
                  ZPText(
                    keyText: LocaleKeys.report_reveal_title_app_bar,
                    style: TextStyles.w600Size17White1,
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: GestureDetector(
                              onTap: () {
                                appRouter.replaceAll([const ReportRoute()]);
                              },
                              child: const ZPIcon(
                                Ics.icClose,
                                width: 30,
                                height: 30,
                                color: AppColors.white1,
                              )),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  ZPText(
                    keyText: LocaleKeys.report_reveal_description_1,
                    style: TextStyles.w700Size22White1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ZPText(
                    keyText: LocaleKeys.report_reveal_description_2,
                    style: TextStyles.w500Size17White4,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35.w, 40.h, 35.w, 50.h),
                    child: GestureDetector(
                      onTap: () {
                        appRouter.push(const ReportDetailRoute());
                      },
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.black2, borderRadius: BorderRadius.circular(30)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: const ZPIcon(
                          Images.valentineSDayBackground,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
