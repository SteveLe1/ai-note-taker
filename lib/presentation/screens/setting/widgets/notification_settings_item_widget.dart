import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_switch.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class NotificationSettingsItemWidget extends StatefulWidget {
  String title;
  bool value;
  NotificationSettingsItemWidget({super.key, required this.title, required this.value});

  @override
  State<NotificationSettingsItemWidget> createState() => _NotificationSettingsItemWidgetState(title, value);
}

class _NotificationSettingsItemWidgetState extends State<NotificationSettingsItemWidget> {
  String title;
  bool value;
  _NotificationSettingsItemWidgetState(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: const BoxDecoration(
        color: AppColors.white1,
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.white4)
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: Row(
          children: [
            Expanded(child: ZPText(keyText: title, style: TextStyles.w400Size15Black1,)),
            SizedBox(width: 10.w,),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 20.w),
              child: ZPSwitch(value: value, onChanged: (value) {
                setState(() {
                  this.value = value;

                });
              }),
            )
          ],
        ),
      ),
    );
  }
}
