import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/common/widgets/zp_textfield.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/view_report/widgets/countdown_widget.dart';
import 'package:zippy_flutter/utils/extensions/validate_utils.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  // final CountdownTimerWidget countdownTimer = CountdownTimerWidget();
  bool isPhoneValid = false;
  bool isCountDown = false;
  bool isCheckRestartCountDown = false;
  bool isHaveCode = false;
  bool disableVerificationCompletedBtn = false;

  bool showErrorVerificationCode = false;

  void validatePhone() {
    setState(() {
      if (phoneController.text.isNotEmpty) {
        isPhoneValid = ValidateUtils.validateKoreanPhone(phoneController.text.trim());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.black3,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 19.h,
            ),
            Container(
              height: 44.h,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.grey7, width: 1))),
              child: Row(
                children: [
                  const Expanded(child: SizedBox()),
                  ZPText(
                    keyText: LocaleKeys.phone_verification_title_app_bar,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 40.h, bottom: 20.h),
                    child: ZPText(
                      keyText: LocaleKeys.phone_verification_verify_your_number,
                      style: TextStyles.w700Size22White1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ZPText(
                      keyText: LocaleKeys.phone_verification_description_1,
                      style: TextStyles.w500Size17White4,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ZPText(
                      keyText: LocaleKeys.phone_verification_description_2,
                      style: TextStyles.w400Size13Grey4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.black6, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: ZPTextField(
                              controller: phoneController,
                              hintText: LocaleKeys.phone_verification_hint_mobile_phone_number,
                              hintStyle: TextStyles.w500Size15Grey3,
                              textStyle: TextStyles.w500Size15White1,
                              fillColor: Colors.transparent,
                              borderColor: Colors.transparent,
                              textInputType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {
                                  validatePhone();
                                });
                              },
                            ),
                          ),
                          if (isCountDown)
                            Padding(
                              padding: EdgeInsets.only(right: 13.w),
                              child: CountdownTimerWidget(isCountdown: isCheckRestartCountDown),
                            ),
                          ZPButton(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            text: isCountDown
                                ? LocaleKeys.phone_verification_btn_resend
                                : LocaleKeys.phone_verification_btn_send_authentication_number,
                            textStyle: TextStyles.w500Size11Grey8,
                            radius: 8,
                            height: 28.h,
                            disabled: !isPhoneValid,
                            disableColor: AppColors.grey3,
                            onPressed: () {
                              setState(() {
                                isCountDown = true;
                                isCheckRestartCountDown = true;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.black6, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: ZPTextField(
                              controller: codeController,
                              hintText: LocaleKeys.phone_verification_hint_4_digit_authentication_number,
                              hintStyle: TextStyles.w500Size15Grey3,
                              textStyle: TextStyles.w500Size15White1,
                              fillColor: Colors.transparent,
                              borderColor: Colors.transparent,
                              textInputType: TextInputType.number,
                              maxLength: 4,
                              onChanged: (text) {
                                isCheckRestartCountDown = false;
                                if (text.length == 4 && isCountDown) {
                                  setState(() {
                                    isHaveCode = true;
                                  });
                                } else {
                                  setState(() {
                                    disableVerificationCompletedBtn = false;
                                    isHaveCode = false;
                                  });
                                }
                              },
                            ),
                          ),
                          ZPButton(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            text: LocaleKeys.phone_verification_btn_check_authentication_number,
                            textStyle: TextStyles.w500Size11Grey8,
                            radius: 8,
                            height: 28.h,
                            disabled: !isHaveCode,
                            disableColor: AppColors.grey3,
                            onPressed: () {
                              setState(() {
                                isCheckRestartCountDown = false;
                                disableVerificationCompletedBtn = true;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (showErrorVerificationCode)
                    Padding(
                      padding: EdgeInsets.only(top: 15.h, left: 35.w, right: 35.w),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: ZPText(
                            keyText: "Wrong verification code, please try again",
                            style: TextStyles.w600Size13Red1,
                          )),
                    )
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h, top: 20.h),
              child: ZPButton(
                text: LocaleKeys.phone_verification_btn_verification_completed,
                height: 58.h,
                disabled: !disableVerificationCompletedBtn,
                onPressed: () {
                  appRouter.push(const VerifiedAndPaymentRoute());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
