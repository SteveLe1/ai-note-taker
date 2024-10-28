import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/common/widgets/zp_text_button.dart';
import 'package:zippy_flutter/common/widgets/zp_textfield.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/extensions/validate_utils.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

import '../../../config/routes/app_router.dart';

@RoutePage()
class ChangeAccountMailScreen extends StatefulWidget {
  const ChangeAccountMailScreen({super.key});

  @override
  State<ChangeAccountMailScreen> createState() => _ChangeAccountMailScreenState();
}

class _ChangeAccountMailScreenState extends State<ChangeAccountMailScreen> {
  final newEmailController = TextEditingController();
  bool isEmailInvalid = false;
  bool isEmailSecure = false;
  bool disableCompletedButton = true;
  String errorMessage = "";
  bool validatePassword() {
    if (newEmailController.text.isNotEmpty) {
      isEmailSecure = ValidateUtils.validateEmail(newEmailController.text);
      isEmailInvalid = !isEmailSecure;
      disableCompletedButton = isEmailInvalid;
      errorMessage = !isEmailSecure ? LocaleKeys.change_password_format_password_invalid.tr() : "";
      return isEmailSecure;
    } else {
      isEmailInvalid = false;
      isEmailSecure = false;
      disableCompletedButton = true;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
        context: context,
        title: LocaleKeys.change_account_mail_title_app_bar,
        textStyle: TextStyles.w600Size17Black1,
        backgroundColor: AppColors.white1,
        centerTitle: true,
        isShowDivider: true,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: ZPIcon(
                        Ics.icMail,
                        color: AppColors.mint1,
                        width: 50,
                        height: 50,
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ZPText(
                      keyText: LocaleKeys.change_account_mail_verify_new_email,
                      style: TextStyles.w700Size22Black1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: ZPText(
                      keyText: LocaleKeys.change_account_mail_enter_new_email,
                      style: TextStyles.w500Size17Black5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 40.w, right: 40.w),
                    child: ZPText(
                      keyText: LocaleKeys.change_account_mail_not_receive_email,
                      style: TextStyles.w400Size13Black8,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
                    child: ZPTextField(
                      controller: newEmailController,
                      hintText: LocaleKeys.change_account_mail_enter_email_address,
                      hintStyle: TextStyles.w500Size15Grey3,
                      textStyle: TextStyles.w500Size15Black3,
                      fillColor: AppColors.white4,
                      borderColor: AppColors.white4,
                      onChanged: (text) {
                        setState(() {
                          validatePassword();
                        });
                      },
                    ),
                  ),
                  isEmailSecure
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
                  isEmailInvalid
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
                  SizedBox(height: 10.h,),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 30.w, bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ZPTextButton(
                    text: LocaleKeys.change_account_mail_delete_account,
                    textStyle: TextStyles.w500Size15Red1,
                    onPressed: () {
                      appRouter.push(const DeleteAccountRoute());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, bottom: 30.h, right: 25.w),
              child: ZPButton(
                text: LocaleKeys.change_account_mail_send_email,
                textStyle: TextStyles.w600Size16Grey3,
                disableColor: AppColors.white4,
                disabled: disableCompletedButton,
                width: MediaQuery.of(context).size.width,
                radius: 20,
                onPressed: () {
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
