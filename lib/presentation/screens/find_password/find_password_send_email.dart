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
class FindPasswordSendEmailScreen extends StatefulWidget {
  const FindPasswordSendEmailScreen({super.key});

  @override
  State<FindPasswordSendEmailScreen> createState() => _FindPasswordSendEmailScreenState();
}

class _FindPasswordSendEmailScreenState extends State<FindPasswordSendEmailScreen> {
  final emailController = TextEditingController();
  bool disableSendResetLinkButton = true;
  String errorMessage = "";

  void validateEmail() {
    setState(() {
      if (emailController.text.isNotEmpty) {
        bool isEmailValid = ValidateUtils.validateEmail(emailController.text);
        errorMessage = isEmailValid ? "" : LocaleKeys.error_message_please_check_email_format;
        disableSendResetLinkButton = !isEmailValid;
      } else {
        errorMessage = "";
        disableSendResetLinkButton = true;
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
                              keyText: LocaleKeys.find_pw_enter_email_address,
                              style: TextStyles.w700Size22Black1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ZPText(
                            keyText: LocaleKeys.find_pw_send_email_description,
                            style: TextStyles.w500Size17Black5,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h, bottom: 40.h),
                            child: ZPText(
                              keyText: LocaleKeys.find_pw_send_email_check_spam_folder,
                              style: TextStyles.w400Size13Black8,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ZPTextField(
                            controller: emailController,
                            borderColor: AppColors.white4,
                            fillColor: AppColors.white4,
                            hintText: LocaleKeys.find_pw_enter_email_address,
                            hintStyle: TextStyles.w500Size15Grey3,
                            textStyle: TextStyles.w500Size15Black3,
                            onChanged: (text) {
                              validateEmail();
                            },
                          ),
                          errorMessage.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(top: 10.h, left: 15.w),
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
                            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 30.h),
                            child: Column(
                              children: [
                                ZPButton(
                                  disableColor: AppColors.white4,
                                  disabled: disableSendResetLinkButton,
                                  text: LocaleKeys.find_pw_send_reset_link,
                                  width: MediaQuery.of(context).size.width,
                                  onPressed: () {
                                    appRouter.push(const FindPasswordVerifyEmailRoute());
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
