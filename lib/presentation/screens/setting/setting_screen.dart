import 'package:auto_route/annotations.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/setting/widgets/setting_item_widget.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white4,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                        width: 32.w,
                        height: 32.h,
                        padding: EdgeInsets.all(4.0.w),
                        decoration: const BoxDecoration(color: AppColors.greyTextField, shape: BoxShape.circle),
                        child:  const Icon(Icons.close, color: AppColors.greySearch,)
                    )),
              ),
              SizedBox(height: 12.h,),
              ZPText(keyText: "Settings", style: TextStyles.w700Size32Black3,),
              SizedBox(height: 12.h,),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZPText(keyText: "For you", style: TextStyles.w600Size22Black3,),
                        SizedBox(height: 12.h,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                          decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              SettingItemWidget(
                                icon: Ics.icMail,
                                textTitle: "Give Coconote 5 stars",
                                onPressed: () {
                                  appRouter.push(const ChangeAccountMailRoute());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icPassword,
                                textTitle: "Invite a friend",
                                onPressed: () {
                                  appRouter.push(const ChangePasswordRouteStep1());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icNotie,
                                textTitle: "Join the Discord",
                                isShowDivider: false,
                                onPressed: () {
                                  appRouter.push(const NotificationSettingsRoute());
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        ZPButton(text: "Get Unlimited Notes", textStyle: TextStyles.w700Size17White1,
                          color: AppColors.blueButton,
                          onPressed: () {},),
                        SizedBox(height: 20.h),
                        ZPText(keyText: "Support & feedback", style: TextStyles.w600Size22Black3,),
                        SizedBox(height: 12.h,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                          decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: SettingItemWidget(
                            isShowDivider: false,
                            icon: Ics.icMail,
                            textTitle: "Help Center",
                            onPressed: () {
                              appRouter.push(const ChangeAccountMailRoute());
                            },
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        ZPText(keyText: "Account", style: TextStyles.w600Size22Black3,),
                        ZPText(keyText: "abczxc@gmail.com", style: TextStyles.w500Size14Grey1,),
                        SizedBox(height: 20.h,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                          decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              SettingItemWidget(
                                icon: Ics.icMail,
                                textTitle: "Failed Recordings",
                                onPressed: () {
                                  appRouter.push(const ChangeAccountMailRoute());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icPassword,
                                textTitle: "Family Plan",
                                onPressed: () {
                                  appRouter.push(const ChangePasswordRouteStep1());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icNotie,
                                textTitle: "Restore Purchases",
                                onPressed: () {
                                  appRouter.push(const NotificationSettingsRoute());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icNotie,
                                textTitle: "Term of Service",
                                onPressed: () {
                                  appRouter.push(const NotificationSettingsRoute());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icNotie,
                                textTitle: "Privacy Policy",
                                onPressed: () {
                                  appRouter.push(const NotificationSettingsRoute());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icLogout,
                                textTitle: "Sign Out",
                                textStyle: TextStyles.w600Size16Red1,
                                iconColor: AppColors.red1,
                                onPressed: () {
                                  appRouter.push(const NotificationSettingsRoute());
                                },
                              ),
                              SettingItemWidget(
                                icon: Ics.icDelete,
                                isShowDivider: false,
                                textTitle: "Delete Account",
                                textStyle: TextStyles.w600Size16Red1,
                                iconColor: AppColors.red1,
                                onPressed: () {
                                  appRouter.push(const NotificationSettingsRoute());
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
