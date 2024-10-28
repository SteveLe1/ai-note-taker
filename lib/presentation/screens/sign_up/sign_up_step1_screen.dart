import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_app_bar.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/common/widgets/zp_textfield.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/sign_up/terms_conditions_bottom_sheet.dart';
import 'package:coconut_note/utils/extensions/validate_utils.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  bool isEmailValid = false;
  bool disableNextButton = true;
  String errorMessage = "";

  void validateEmail() {
    setState(() {
      if (emailController.text.isNotEmpty) {
        isEmailValid = ValidateUtils.validateEmail(emailController.text);
        disableNextButton = !isEmailValid;
        errorMessage = isEmailValid ? "" : LocaleKeys.error_message_please_check_email_format;
      } else {
        isEmailValid = false;
        disableNextButton = true;
        errorMessage = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
          isShowDivider: true,
          context: context,
          disableLeading: true,
          centerTitle: true,
          title: LocaleKeys.signup,
          textStyle: TextStyles.w600Size17Black3,
          actionWidgets: [
            Padding(
              padding: EdgeInsets.only(right: 23.w),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: ZPIcon(
                  Ics.icClose,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ]),
      child: LayoutBuilder(builder: (context, constraint) {
        return Form(
          child: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.h, bottom: 30.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Container(
                                    color: AppColors.mint1,
                                    width: 26,
                                    height: 26,
                                    child: const Center(
                                      child: Text(
                                        '1',
                                        style: TextStyles.w600Size15Black3,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 22.w,
                                    child: Divider(
                                      color: AppColors.grey5,
                                      height: 22.h,
                                    )),
                                ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white1,
                                      border: Border.all(color: AppColors.grey5, width: 1.5),
                                      shape: BoxShape.circle,
                                    ),
                                    width: 26,
                                    height: 26,
                                    child: const Center(
                                      child: Text(
                                        '2',
                                        style: TextStyles.w600Size15Grey5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                            child: ZPText(
                              keyText: LocaleKeys.enter_your_email,
                              style: TextStyles.w700Size22Black1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ZPText(
                            keyText: LocaleKeys.signup_email_description1,
                            style: TextStyles.w500Size17Black5,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h, bottom: 40.h),
                            child: ZPText(
                              keyText: LocaleKeys.signup_email_description2,
                              style: TextStyles.w400Size13Black8,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ZPTextField(
                            controller: emailController,
                            borderColor: AppColors.white4,
                            fillColor: AppColors.white4,
                            hintText: LocaleKeys.id_email,
                            hintStyle: TextStyles.w500Size15Grey3,
                            textStyle: TextStyles.w500Size15Black3,
                            onChanged: (text) {
                              validateEmail();
                            },
                          ),
                          isEmailValid
                              ? Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: Row(
                                    children: [
                                      const ZPIcon(Ics.icCircleCheck, color: AppColors.mint1),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      ZPText(
                                        keyText: LocaleKeys.message_username_is_available,
                                        style: TextStyles.w600Size13Mint1,
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          errorMessage.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: Row(
                                    children: [
                                      ZPText(
                                        keyText: LocaleKeys.error_message_please_check_email_format,
                                        style: TextStyles.w600Size13Red1,
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: LocaleKeys.signup_step1_already_a_member.tr(),
                                            style: TextStyles.w700Size15Grey1),
                                        TextSpan(
                                          text: LocaleKeys.signup_step1_login.tr(),
                                          style: TextStyles.w700Size15Mint1,
                                          recognizer: TapGestureRecognizer()..onTap = () => appRouter.pop(),
                                        ),
                                        TextSpan(
                                            text: LocaleKeys.signup_step1_please.tr(),
                                            style: TextStyles.w700Size15Grey1),
                                      ],
                                    ),
                                  ),
                                ),
                                ZPButton(
                                  disableColor: AppColors.white4,
                                  disabled: disableNextButton,
                                  text: LocaleKeys.next,
                                  width: MediaQuery.of(context).size.width,
                                  onPressed: () {
                                    TermsConditionsBottomSheet().showBottomSheet(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
        );
      }),
    );
  }
}
