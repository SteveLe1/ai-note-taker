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
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreen();
}

class _VerifyEmailScreen extends State<VerifyEmailScreen> {
  bool isShowMessageError = false;
  bool disableNextButton = true;

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
                              keyText: LocaleKeys.please_check_your_email,
                              style: TextStyles.w700Size22Black1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 38.h, left: 5.w, right: 5.w),
                            child: ZPText(
                              keyText: LocaleKeys.verify_email_description,
                              style: TextStyles.w500Size17Black5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white4, //add it here
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: ZPTextField(
                                    enabled: false,
                                    borderColor: AppColors.white4,
                                    fillColor: AppColors.white4,
                                    hintText: "zippy@gmail.com",
                                    hintStyle: TextStyles.w500Size15Grey3,
                                    textStyle: TextStyles.w500Size15Black3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: ZPText(
                                          keyText: "03:00",
                                          style: TextStyles.w500Size15Grey1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      ZPButton(
                                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                                        radius: 8,
                                        disabled: false,
                                        color: AppColors.black3,
                                        textStyle: TextStyles.w500Size12White1,
                                        text: LocaleKeys.resend,
                                        height: 40.h,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          ZPIcon(
                            Ics.icEmailBox,
                            width: 140.w,
                            height: 140.h,
                            color: AppColors.grey5,
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: ZPButton(
                              disabled: false,
                              text: LocaleKeys.verification_completed,
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                appRouter.push(const SetPasswordRoute());
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
