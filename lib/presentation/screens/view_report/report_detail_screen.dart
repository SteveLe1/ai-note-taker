import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/toast/toast_common.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/view_report/widgets/report_detail_empty_widget.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({super.key});

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  RatingIcon ratingIcon = RatingIcon(45, 35, 20);
  RatingText ratingText = RatingText(50, 35, 15);
  bool haveData = true;

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
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: GestureDetector(
                              onTap: () {
                                appRouter.back();
                              },
                              child: const ZPIcon(
                                Ics.icArrowLeft,
                                width: 30,
                                height: 30,
                                color: AppColors.white1,
                              )),
                        )),
                  ),
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
                                appRouter.back();
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
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: ZPText(
                            keyText: "사람들 마음 속 당신은",
                            style: TextStyles.w700Size17White1,
                          )),
                    ),
                    !haveData
                        ? const ReportDetailEmptyWidget()
                        : Container(
                          margin: EdgeInsets.only(top: 30.h, left: 35.w, right: 35.w, bottom: 15.h),
                          width: MediaQuery.of(context).size.width,
                          decoration:
                              BoxDecoration(color: AppColors.black2, borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                                child: Stack(
                                  children:[
                                    ZPIcon(
                                      Ics.icFriendly,
                                      width: 160.w,
                                      height: 160.h,
                                    ),
                                    Positioned(
                                      right: 2.w,
                                        bottom: 18.h,
                                        child: ZPIcon(
                                          Images.vipFilterBlack,
                                          width: 42.w,
                                          height: 42.h,
                                        ),
                                    )
                                  ]
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: ZPText(
                                  keyText: "친절한 빛나는 VIP",
                                  style: TextStyles.w700Size26White1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 19.h, left: 57.w, right: 57.w),
                                child: ZPText(
                                  keyText: "WOW, 당신은 주변에서 가장 소중한 인맥인 빛나는 VIP 시네요!\n 주변사람들은 당신의 친절한 모습을 좋아하고 있어요!",
                                  style: TextStyles.w500Size15Grey5,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                                child: const Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: AppColors.black5,
                                ),
                              ),
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: 33.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 16.h,
                                      width: (MediaQuery.of(context).size.width - 110.w) * ratingIcon.icon1 / 100,
                                      decoration: const BoxDecoration(
                                          color: AppColors.black4,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
                                    ),
                                    Container(
                                      height: 16.h,
                                      width: (MediaQuery.of(context).size.width - 110.w) * ratingIcon.icon2 / 100,
                                      decoration: const BoxDecoration(
                                        color: AppColors.black5,
                                      ),
                                    ),
                                    Container(
                                      height: 16.h,
                                      width: (MediaQuery.of(context).size.width - 110.w) * ratingIcon.icon3 / 100,
                                      decoration: const BoxDecoration(
                                          color: AppColors.black6,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left:
                                        ((MediaQuery.of(context).size.width - 110.w) * ratingIcon.icon1 / 100) / 2 -
                                            33.w / 2 +
                                            20.w,
                                    child: ZPIcon(
                                      Ics.icFriendly,
                                      width: 33.w,
                                      height: 33.h,
                                    )),
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: (MediaQuery.of(context).size.width - 110.w) *
                                            (ratingIcon.icon1 + ratingIcon.icon2 / 2) /
                                            100 -
                                        33.w / 2 +
                                        20.w,
                                    child: ZPIcon(
                                      Ics.icOverbearing,
                                      width: 33.w,
                                      height: 33.h,
                                    )),
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: (MediaQuery.of(context).size.width - 110.w) *
                                            (ratingIcon.icon1 + ratingIcon.icon2 + ratingIcon.icon3 / 2) /
                                            100 -
                                        33.w / 2 +
                                        20.w,
                                    child: ZPIcon(
                                      Ics.icWhatever,
                                      width: 33.w,
                                      height: 33.h,
                                    )),
                              ]),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h, bottom: 30.h),
                                child: Stack(alignment: Alignment.center, children: [
                                  Container(
                                    height: 30.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 16.h,
                                        width: (MediaQuery.of(context).size.width - 110.w) * ratingText.text1 / 100,
                                        decoration: const BoxDecoration(
                                            color: AppColors.black4,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
                                      ),
                                      Container(
                                        height: 16.h,
                                        width: (MediaQuery.of(context).size.width - 110.w) * ratingText.text2 / 100,
                                        decoration: const BoxDecoration(
                                          color: AppColors.black5,
                                        ),
                                      ),
                                      Container(
                                        height: 16.h,
                                        width: (MediaQuery.of(context).size.width - 110.w) * ratingText.text3 / 100,
                                        decoration: const BoxDecoration(
                                            color: AppColors.black6,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: ((MediaQuery.of(context).size.width - 110.w) * ratingText.text1 / 100) /
                                              2 -
                                          30.w / 2 +
                                          20.w,
                                      child: ZPIcon(
                                        Images.vipFilterWhite,
                                        width: 30.w,
                                        height: 30.h,
                                      )),
                                  Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: (MediaQuery.of(context).size.width - 110.w) *
                                              (ratingText.text1 + ratingText.text2 / 2) /
                                              100 -
                                          30.w / 2 +
                                          20.w,
                                      child: ZPIcon(
                                        Images.sFilterBlack,
                                        width: 30.w,
                                        height: 30.h,
                                      )),
                                  Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: (MediaQuery.of(context).size.width - 110.w) *
                                              (ratingText.text1 + ratingText.text2 + ratingText.text3 / 2) /
                                              100 -
                                          30.w / 2 +
                                          20.w,
                                      child: ZPIcon(
                                        Images.aFilterBlack,
                                        width: 30.w,
                                        height: 30.h,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                        ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Wrap(
                        spacing: 60.w,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              ToastCommon.showDIToastWidget(LocaleKeys.report_detail_message_save_image);
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(right: 10.w),
                                elevation: 0,
                                disabledBackgroundColor: AppColors.white1,
                                backgroundColor: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ZPIcon(
                                  Ics.icDownload,
                                  width: 36.w,
                                  height: 36.h,
                                  color: AppColors.mint1,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                ZPText(
                                  keyText: LocaleKeys.report_detail_save,
                                  style: TextStyles.w600Size13White1,
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 60.w,),
                          ElevatedButton(
                            onPressed: () {
                              ToastCommon.showDIToastWidget(LocaleKeys.report_detail_message_save_image);
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(right: 10.w),
                                elevation: 0,
                                disabledBackgroundColor: AppColors.white1,
                                backgroundColor: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ZPIcon(
                                  Ics.icShare,
                                  width: 36.w,
                                  height: 36.h,
                                  color: AppColors.mint1,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                ZPText(
                                  keyText: LocaleKeys.report_detail_save,
                                  style: TextStyles.w600Size13White1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingIcon {
  double icon1;
  double icon2;
  double icon3;

  RatingIcon(this.icon1, this.icon2, this.icon3);
}

class RatingText {
  double text1;
  double text2;
  double text3;

  RatingText(this.text1, this.text2, this.text3);
}
