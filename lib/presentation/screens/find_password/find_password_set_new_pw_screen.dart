import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:coconut_note/utils/extensions/validate_utils.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class FindPasswordSetNewPwScreen extends StatefulWidget {
  const FindPasswordSetNewPwScreen({super.key});

  @override
  State<FindPasswordSetNewPwScreen> createState() => _FindPasswordSetNewPwScreenState();
}

class _FindPasswordSetNewPwScreenState extends State<FindPasswordSetNewPwScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordSecure = false;
  bool disableCompletedButton = true;
  String errorMessage = "";

  bool validatePassword() {
    if (newPasswordController.text.isEmpty && confirmPasswordController.text.isEmpty) {
      isPasswordSecure = false;
      disableCompletedButton = true;
      errorMessage = "";
      return false;
    } else {
      bool newPwValid = ValidateUtils.validatePassword(newPasswordController.text);
      bool confirmPwsValid = ValidateUtils.validatePassword(confirmPasswordController.text);
      if (!newPwValid || !confirmPwsValid) {
        disableCompletedButton = !isPasswordSecure;
        errorMessage = !isPasswordSecure ? LocaleKeys.error_message_password_invalid.tr() : "";
        return false;
      } else if (newPasswordController.text != confirmPasswordController.text) {
        errorMessage = LocaleKeys.find_pw_error_message_password_not_match;
        isPasswordSecure = false;
        disableCompletedButton = true;
        return false;
      } else {
        errorMessage = "";
        isPasswordSecure = true;
        disableCompletedButton = false;
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
          isShowDivider: true,
          context: context,
          disableLeading: false,
          centerTitle: true,
          title: LocaleKeys.find_password,
          textStyle: TextStyles.w600Size17Black3,
          leadingWidget: InkWell(
            onTap: () => appRouter.pop(context),
            child: const ZPIcon(
              Ics.icArrowLeft,
              width: 30,
              height: 30,
              color: AppColors.black1,
            ),
          )),
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
                                    decoration: BoxDecoration(
                                      color: AppColors.white1,
                                      border: Border.all(color: AppColors.grey5, width: 1.5),
                                      shape: BoxShape.circle,
                                    ),
                                    width: 26,
                                    height: 26,
                                    child: const Center(
                                      child: Text(
                                        '1',
                                        style: TextStyles.w600Size15Grey5,
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
                                    color: AppColors.mint1,
                                    width: 26,
                                    height: 26,
                                    child: const Center(
                                      child: Text(
                                        '2',
                                        style: TextStyles.w600Size15Black3,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: ZPText(
                              keyText: LocaleKeys.find_pw_set_new_password,
                              style: TextStyles.w700Size22Black1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 38.h),
                            child: ZPText(
                              keyText: LocaleKeys.set_password_description,
                              style: TextStyles.w500Size17Black5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ZPTextField(
                            maxLength: 16,
                            obscureText: true,
                            controller: newPasswordController,
                            borderColor: AppColors.white4,
                            fillColor: AppColors.white4,
                            hintText: LocaleKeys.find_pw_set_password,
                            hintStyle: TextStyles.w500Size15Grey3,
                            textStyle: TextStyles.w500Size15Black3,
                            onChanged: (text) {
                              setState(() {
                                validatePassword();
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ZPTextField(
                            maxLength: 16,
                            obscureText: true,
                            controller: confirmPasswordController,
                            borderColor: AppColors.white4,
                            fillColor: AppColors.white4,
                            hintText: LocaleKeys.find_pw_confirm_password,
                            hintStyle: TextStyles.w500Size15Grey3,
                            textStyle: TextStyles.w500Size15Black3,
                            onChanged: (text) {
                              setState(() {
                                validatePassword();
                              });
                            },
                          ),
                          isPasswordSecure
                              ? Padding(
                                  padding: EdgeInsets.only(top: 15.h, left: 15.w),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width, // 1st set height
                                    child: ZPText(
                                      textAlign: TextAlign.start,
                                      keyText: LocaleKeys.password_secure,
                                      style: TextStyles.w600Size13Mint1,
                                    ), // 2nd wrap in FittedBox
                                  ),
                                )
                              : const SizedBox(),
                          errorMessage.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(top: 15.h, left: 15.w),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width, // 1st set height
                                    child: ZPText(
                                      textAlign: TextAlign.start,
                                      keyText: errorMessage,
                                      style: TextStyles.w600Size13Red1,
                                    ), // 2nd wrap in FittedBox
                                  ),
                                )
                              : const SizedBox(),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h, left: 5.w, right: 5.w),
                            child: ZPButton(
                              disableColor: AppColors.white4,
                              disabled: disableCompletedButton,
                              text: LocaleKeys.find_pw_completed,
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                if (validatePassword()) {
                                  appRouter.push(const SignInRoute());
                                }
                              },
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
