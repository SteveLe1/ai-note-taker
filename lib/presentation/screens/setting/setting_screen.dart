import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/setting/widgets/setting_item_widget.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white4,
      appBar: ZPAppBar(
        context: context,
        title: LocaleKeys.setting_settings,
        textStyle: TextStyles.w700Size17Black1,
        centerTitle: true,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30.w, 11.h, 20.w, 0),
            color: AppColors.white1,
            child: Column(
              children: [
                SettingItemWidget(
                  icon: Ics.icMail,
                  textTitle: LocaleKeys.setting_change_account_mail,
                  onPressed: () {
                    appRouter.push(const ChangeAccountMailRoute());
                  },
                ),
                SettingItemWidget(
                  icon: Ics.icPassword,
                  textTitle: LocaleKeys.setting_change_password,
                  onPressed: () {
                    appRouter.push(const ChangePasswordRouteStep1());
                  },
                ),
                SettingItemWidget(
                  icon: Ics.icNotie,
                  textTitle: LocaleKeys.setting_alarm_settings,
                  onPressed: () {
                    appRouter.push(const NotificationSettingsRoute());
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.fromLTRB(30.w, 11.h, 20.w, 0),
            color: AppColors.white1,
            child: Column(
              children: [
                SettingItemWidget(
                  icon: Ics.icList,
                  textTitle: LocaleKeys.setting_event_announcement,
                  onPressed: () {
                    appRouter.push(const EventNoticeRoute());
                  },
                ),
                SettingItemWidget(
                  icon: Ics.icTagLine,
                  textTitle: LocaleKeys.setting_tag_management,
                  onPressed: () {},
                ),
                SettingItemWidget(
                  icon: Ics.icCrownFill,
                  textTitle: LocaleKeys.setting_premium_pricing_plan,
                  iconColor: AppColors.mint1,
                  onPressed: () {
                    appRouter.push(const PremiumPricingPlanRoute());
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.fromLTRB(30.w, 11.h, 20.w, 0),
            color: AppColors.white1,
            child: SettingItemWidget(
              icon: Ics.icLogout,
              textTitle: LocaleKeys.setting_log_out,
              isShowTrailing: false,
              onPressed: () {appRouter.replaceAll([const SignInRoute()]);},
            ),
          ),
        ],
      ),
    );
  }
}
