import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/on_boarding/widgets/permission_setting_item_widget.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class AppPermissionSettingsScreen extends StatefulWidget {
  const AppPermissionSettingsScreen({super.key});

  @override
  State<AppPermissionSettingsScreen> createState() => _AppPermissionSettingsScreenState();
}

class _AppPermissionSettingsScreenState extends State<AppPermissionSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 70.h, right: 20.w),
                      child: ZPText(
                        keyText: LocaleKeys.app_permission_settings_title,
                        style: TextStyles.w700Size22Black3,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 25.h, right: 20.w),
                      child: ZPText(
                        keyText: LocaleKeys.app_permission_settings_description,
                        style: TextStyles.w400Size15Black5,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 35.h),
                    child: Divider(
                      thickness: 1,
                      height: 1.h,
                      color: AppColors.grey5,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  PermissionSettingItemWidget(
                      icon: Ics.icContact2,
                      permission: LocaleKeys.app_permission_settings_title_contact,
                      description: LocaleKeys.app_permission_settings_description_contact,
                      rule: ZPText(keyText: LocaleKeys.app_permission_settings_required, style: TextStyles.w600Size13Red1,)),
                  PermissionSettingItemWidget(
                      icon: Ics.icNotieFill,
                      permission: LocaleKeys.app_permission_settings_title_notifications,
                      description: LocaleKeys.app_permission_settings_description_notifications,
                      rule: ZPText(keyText: LocaleKeys.app_permission_settings_optional, style: TextStyles.w600Size13Black8,)),
                  PermissionSettingItemWidget(
                      icon: Ics.icCall,
                      permission: LocaleKeys.app_permission_settings_title_call,
                      description: LocaleKeys.app_permission_settings_description_call,
                      rule: ZPText(keyText: LocaleKeys.app_permission_settings_required, style: TextStyles.w600Size13Black8,)),
                  PermissionSettingItemWidget(
                      icon: Ics.icMessage,
                      permission: LocaleKeys.app_permission_settings_title_message,
                      description: LocaleKeys.app_permission_settings_description_message,
                      rule: ZPText(keyText: LocaleKeys.app_permission_settings_required, style: TextStyles.w600Size13Black8,)),
                  PermissionSettingItemWidget(
                      icon: Ics.icPhotoLibrary,
                      permission: LocaleKeys.app_permission_settings_title_photo_library,
                      description: LocaleKeys.app_permission_settings_description_photo_library,
                      rule: ZPText(keyText: LocaleKeys.app_permission_settings_required, style: TextStyles.w600Size13Black8,)),
                  SizedBox(
                    height: 25.h,
                  )
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 30.h),
              child: ZPButton(
                text: LocaleKeys.app_permission_settings_confirm,
                textStyle: TextStyles.w600Size16Black3,
                height: 58.h,
                color: AppColors.mint2,
                onPressed: () {
                  appRouter.replace(const OnBoardingRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
