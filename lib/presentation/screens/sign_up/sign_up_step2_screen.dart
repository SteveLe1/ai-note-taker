import 'package:auto_route/annotations.dart';
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
class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final passwordController = TextEditingController();
  bool isPasswordInvalid = false;
  bool isPasswordSecure = false;
  bool disableSignupCompletedButton = true;

  void validatePassword() {
    setState(() {
      if (passwordController.text.isNotEmpty) {
        isPasswordSecure = ValidateUtils.validatePassword(passwordController.text);
        isPasswordInvalid = !isPasswordSecure;
        disableSignupCompletedButton = isPasswordInvalid;
      } else {
        isPasswordInvalid = false;
        isPasswordSecure = false;
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
                            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                            child: ZPText(
                              keyText: LocaleKeys.enter_your_email,
                              style: TextStyles.w700Size22Black1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: ZPText(
                              keyText: LocaleKeys.set_password_description,
                              style: TextStyles.w500Size17Black5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ZPTextField(
                            maxLength: 16,
                            obscureText: true,
                            controller: passwordController,
                            borderColor: AppColors.white4,
                            fillColor: AppColors.white4,
                            hintText: LocaleKeys.set_password_hint,
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
                          isPasswordInvalid
                              ? Padding(
                                  padding: EdgeInsets.only(top: 15.h, left: 15.w),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width, // 1st set height
                                    child: ZPText(
                                      textAlign: TextAlign.start,
                                      keyText: LocaleKeys.error_message_password_invalid,
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
                              disabled: disableSignupCompletedButton,
                              text: LocaleKeys.sign_up_completed,
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                appRouter.push(const AppPermissionSettingsRoute());
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
