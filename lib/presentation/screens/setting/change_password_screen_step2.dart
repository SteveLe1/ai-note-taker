import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/utils/extensions/validate_utils.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

import '../../../common/widgets/background_widget.dart';
import '../../../common/widgets/zp_app_bar.dart';
import '../../../common/widgets/zp_button.dart';
import '../../../common/widgets/zp_icon.dart';
import '../../../common/widgets/zp_text.dart';
import '../../../common/widgets/zp_textfield.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../utils/resources/resources.dart';
import '../../../utils/style/text_styles.dart';
@RoutePage()
class ChangePasswordScreenStep2 extends StatefulWidget {
  const ChangePasswordScreenStep2({super.key});

  @override
  State<ChangePasswordScreenStep2> createState() => _ChangePasswordScreenStep2State();
}

class _ChangePasswordScreenStep2State extends State<ChangePasswordScreenStep2> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordInvalid = false;
  bool isPasswordSecure = false;
  bool disableCompletedButton = true;
  String errorMessage = "";

  bool validatePassword() {
    if (newPasswordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
      if(newPasswordController.text != confirmPasswordController.text) {
        errorMessage = LocaleKeys.change_password_password_not_match;
        isPasswordInvalid = true;
        isPasswordSecure = false;
        disableCompletedButton = true;
        return false;
      } else {
        isPasswordSecure = ValidateUtils.validatePassword(newPasswordController.text) &&
            ValidateUtils.validatePassword(confirmPasswordController.text);
        isPasswordInvalid = !isPasswordSecure;
        disableCompletedButton = isPasswordInvalid;
        errorMessage = !isPasswordSecure ? LocaleKeys.change_password_format_password_invalid.tr() : "";
        return isPasswordSecure;
      }
    } else if (newPasswordController.text.isNotEmpty){
      isPasswordSecure = ValidateUtils.validatePassword(newPasswordController.text);
      isPasswordInvalid = !isPasswordSecure;
      disableCompletedButton = true;
      errorMessage = !isPasswordSecure ? LocaleKeys.change_password_format_password_invalid.tr() : "";
      return isPasswordSecure;
    }
    else {
      isPasswordInvalid = false;
      isPasswordSecure = false;
      disableCompletedButton = true;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(context: context, title: LocaleKeys.change_password_title_app_bar,textStyle: TextStyles.w600Size17Black1,backgroundColor: AppColors.white1, centerTitle: true, isShowDivider: true,),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top: 30.h),
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                              child: ZPIcon(Ics.icPassword, color: AppColors.mint1, width: 50, height: 50,)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: ZPText(keyText: LocaleKeys.change_password_set_new_password, style: TextStyles.w700Size22Black1,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: ZPText(keyText: LocaleKeys.change_password_description, style: TextStyles.w500Size17Black5, textAlign: TextAlign.center,),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
                        child: ZPTextField(controller:newPasswordController,hintText: LocaleKeys.change_password_set_password, maxLength: 18, hintStyle: TextStyles.w500Size15Grey3, textStyle: TextStyles.w500Size15Black3, fillColor: AppColors.white4,borderColor: AppColors.white4,
                          onChanged: (text) {
                            setState(() {
                              validatePassword();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w,),
                        child: ZPTextField(controller: confirmPasswordController,hintText: LocaleKeys.change_password_confirm_password, maxLength: 18, hintStyle: TextStyles.w500Size15Grey3, textStyle: TextStyles.w500Size15Black3, fillColor: AppColors.white4,borderColor: AppColors.white4,
                          onChanged: (text) {
                            setState(() {
                              validatePassword();
                            });
                          },),
                      ),
                      isPasswordSecure
                          ? Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width, // 1st set height
                          child: ZPText(
                            textAlign: TextAlign.start,
                            keyText: LocaleKeys.change_password_format_password_valid,
                            style: TextStyles.w600Size13Mint1,
                          ), // 2nd wrap in FittedBox
                        ),
                      )
                          : const SizedBox(),
                      isPasswordInvalid
                          ? Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
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
                      SizedBox(height: 10.h,)

                    ],
                  ),
                )
            ),
            Padding(
              padding:  EdgeInsets.only(left: 25.w, bottom: 30.h, right: 25.w),
              child: ZPButton(text: LocaleKeys.change_password_complete,disabled: disableCompletedButton, disableColor: AppColors.white4,  width: MediaQuery.of(context).size.width, radius: 20,
                onPressed: (){
                  appRouter.push(const SettingRoute());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}