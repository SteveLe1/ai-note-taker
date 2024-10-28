import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      appBar: ZPAppBar(context: context, title: LocaleKeys.delete_account_title_app_bar, textStyle: TextStyles.w600Size17Black1,backgroundColor: AppColors.white1, centerTitle: true, isShowDivider: true,),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 225.h),
                        child: ZPIcon(Ics.icAlert, color: AppColors.red1, width: 100, height: 100,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 38.w, right: 38.w, top: 30.w),
                        child: ZPText(keyText: LocaleKeys.delete_account_description, style: TextStyles.w500Size17Black5, textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 30.h),
              child: ZPButton(text: LocaleKeys.delete_account_button, height: 58.h, color: AppColors.red1, ),
            )
          ],
        ),
      ),
    );
  }
}
