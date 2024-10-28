import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_app_bar.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/common/widgets/zp_time_picker.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/setting/widgets/notification_settings_item_widget.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  late int hours;
  late int mins;
  late bool isItAm;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      appBar: ZPAppBar(
        context: context,
        title: LocaleKeys.change_account_mail_title_app_bar,
        textStyle: TextStyles.w600Size17Black1,
        backgroundColor: AppColors.white1,
        centerTitle: true,
        isShowDivider: true,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotificationSettingsItemWidget(title: LocaleKeys.notification_settings_service_notification, value: true),
              Container(
                padding: EdgeInsets.fromLTRB(30.w, 20.h, 20.w, 20.h),
                color: AppColors.white1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ZPText(
                            keyText: LocaleKeys.notification_settings_push_notification_sending_time,
                            style: TextStyles.w600Size14Black5,
                          ),
                        ),
                        ZPTimePicker(
                          onChanged: (DateTime value) {},
                          initDateTime: DateTime.now(),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 15.h),
                        width: 232.w,
                        child: ZPText(
                          keyText: LocaleKeys.notification_settings_description_sending_time,
                          style: TextStyles.w400Size13Black8,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              NotificationSettingsItemWidget(
                  title: LocaleKeys.notification_settings_event_and_benefit_notifications, value: false),
              Container(
                padding: EdgeInsets.fromLTRB(30.w, 20.h, 54.w, 20.h),
                color: AppColors.white1,
                child: ZPText(
                  keyText: LocaleKeys.notification_settings_description_event_and_benefit,
                  style: TextStyles.w400Size13Black8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
