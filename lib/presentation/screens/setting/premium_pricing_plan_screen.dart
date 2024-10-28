import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class PremiumPricingPlanScreen extends StatefulWidget {
  const PremiumPricingPlanScreen({super.key});

  @override
  State<PremiumPricingPlanScreen> createState() => _PremiumPricingPlanScreenState();
}

class _PremiumPricingPlanScreenState extends State<PremiumPricingPlanScreen> {
  String yearPrice = "49,000";
  String approximately_month_price = "4,083";
  String monthPrice = "4,900";
  String discount = "17";
  bool chooseProSubscription = true;
  String numberOfTag = "50";

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.black3,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 63.h,
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.grey7))),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    ZPText(
                      keyText: LocaleKeys.premium_pricing_plan_title_app_bar,
                      style: TextStyles.w600Size16White1,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            appRouter.pop(context);
                          },
                          child: const ZPIcon(
                            Ics.icClose,
                            width: 30,
                            height: 30,
                            color: AppColors.white1,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 29.w, top: 30.h),
                  width: 230.w,
                  child: ZPText(
                    keyText: LocaleKeys.premium_pricing_plan_description,
                    style: TextStyles.w700Size22White1,
                  )),
              SizedBox(
                height: 35.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    chooseProSubscription = !chooseProSubscription;
                  });
                },
                child: Stack(children: [
                  Container(
                    padding: EdgeInsets.only(top: 13.h),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: chooseProSubscription ? AppColors.mint3.withOpacity(0.2) : AppColors.black5,
                            border:
                                Border.all(width: 2, color: chooseProSubscription ? AppColors.mint1 : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        constraints: BoxConstraints(minHeight: 100.h),
                        width: MediaQuery.of(context).size.width - 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: ZPIcon(
                                chooseProSubscription ? Ics.icRadioOn : Ics.icCircle,
                                width: 30,
                                height: 30,
                                color: AppColors.white1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ZPText(
                                      keyText: LocaleKeys.premium_pricing_plan_yearly,
                                      style: TextStyles.w700Size17White1,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    ZPText(
                                      keyText: LocaleKeys.premium_pricing_plan_30_day_free_trial,
                                      style: TextStyles.w500Size13Grey5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30.w),
                              child: SizedBox(
                                width: 110.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ZPText(
                                      keyText:
                                          LocaleKeys.premium_pricing_plan_won_per_year.tr(namedArgs: {'price': yearPrice}),
                                      style: TextStyles.w700Size17White1,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    ZPText(
                                      keyText: LocaleKeys.premium_pricing_plan_approximately_won_per_month
                                          .tr(namedArgs: {'price': approximately_month_price}),
                                      style: TextStyles.w500Size13Grey5,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  chooseProSubscription
                      ? Positioned(
                          left: 40.w,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                            ),
                            decoration: BoxDecoration(color: AppColors.mint1, borderRadius: BorderRadius.circular(16)),
                            height: 26.h,
                            child: Center(
                              child: ZPText(
                                keyText: LocaleKeys.premium_pricing_plan_discount.tr(namedArgs: {'discount': discount}),
                                style: TextStyles.w600Size13Black3,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ]),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    chooseProSubscription = !chooseProSubscription;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: !chooseProSubscription ? AppColors.mint3.withOpacity(0.2) : AppColors.black5,
                        border: Border.all(width: 2, color: !chooseProSubscription ? AppColors.mint1 : Colors.transparent),
                        borderRadius: BorderRadius.circular(15)),
                    constraints: BoxConstraints(minHeight: 100.h),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: ZPIcon(
                            !chooseProSubscription ? Ics.icRadioOn : Ics.icCircle,
                            width: 30,
                            height: 30,
                            color: AppColors.white1,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ZPText(
                                  keyText: LocaleKeys.premium_pricing_plan_monthly,
                                  style: TextStyles.w700Size17White1,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                ZPText(
                                  keyText: LocaleKeys.premium_pricing_plan_pay_every_month,
                                  style: TextStyles.w500Size13Grey5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ZPText(
                                keyText:
                                    LocaleKeys.premium_pricing_plan_won_per_month.tr(namedArgs: {'price': monthPrice}),
                                style: TextStyles.w700Size17White1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 27.w, top: 35.h, right: 27.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ZPIcon(
                      Ics.icNote,
                      width: 24,
                      height: 24,
                      color: AppColors.white4,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 240.w),
                      child: ZPText(
                        keyText: LocaleKeys.premium_pricing_plan_record_information,
                        style: TextStyles.w500Size14White4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 27.w, top: 20.h, right: 27.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ZPIcon(
                      Ics.icNote,
                      width: 24,
                      height: 24,
                      color: AppColors.white4,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 240.w),
                      child: ZPText(
                        keyText: LocaleKeys.premium_pricing_plan_convenience_without_annoying_ads,
                        style: TextStyles.w500Size14White4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                child: Divider(height: 1.h, thickness: 1.h, color: AppColors.black5,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 30.h, right: 20.w),
                child: Column(
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.black4
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_function, style: TextStyles.w500Size14White1,))),
                          Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_pro, style: TextStyles.w700Size16Mint1,))),
                          Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_free, style: TextStyles.w500Size16White1,))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_number_of_tag, style: TextStyles.w500Size14White1,))),
                        Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_unlimited, style: TextStyles.w600Size14Zippy1,))),
                        Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_tags.tr(namedArgs: {'number' : numberOfTag}), style: TextStyles.w500Size14White1,))),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, left: 5.w, right: 5.w, bottom: 20.h),
                      child: Divider(height: 1.h, thickness: 1.h, color: AppColors.black5,),
                    ),
                    Row(
                      children: [
                        Expanded(child: Center(child: ZPText(keyText: LocaleKeys.premium_pricing_plan_ads, style: TextStyles.w500Size14White1,))),
                        Expanded(child: Center(child: ZPText(keyText: "X", style: TextStyles.w600Size14Zippy1,))),
                        Expanded(child: Center(child: ZPText(keyText: "O", style: TextStyles.w500Size14White1,))),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25.w, 48.h, 25.w, 30.h),
                child: Container(
                    constraints: BoxConstraints(minHeight: 58.h),
                    child: const ZPButton(text: LocaleKeys.premium_pricing_plan_start_your_30_day_trial,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
