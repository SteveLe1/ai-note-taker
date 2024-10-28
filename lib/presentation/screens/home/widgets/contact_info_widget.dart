import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class ContactInfoWidget extends StatelessWidget {
  final String iconCircle;
  final String labelTitle;
  final String labelSubTitle;
  final String quantityPeople;
  final VoidCallback? onPressed;

  const ContactInfoWidget({
    super.key,
    required this.iconCircle,
    required this.labelTitle,
    required this.labelSubTitle,
    required this.quantityPeople,
    this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        margin: EdgeInsets.only(top: 15.0.h),
        decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  padding: EdgeInsets.all(9.0.w),
                  decoration: const BoxDecoration(
                      color: AppColors.mint2,
                      shape: BoxShape.circle
                  ),
                  child: ZPIcon(iconCircle),
                ),
                ZPIcon(Ics.icArrowRight2, width: 30.w, height: 30.h,)
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZPText(keyText: labelTitle, style: TextStyles.w700Size18Black3, overflow: TextOverflow.ellipsis, maxLines: 2,),
                      SizedBox(height: 5.0.h,),
                      ZPText(keyText: labelSubTitle, style: TextStyles.w500Size11Black8, overflow: TextOverflow.ellipsis, maxLines: 2),
                    ],
                  ),
                ),
                ZPText(keyText: LocaleKeys.home_people,
                  namedArgs: {'quantity': quantityPeople},
                  style: TextStyles.w500Size26Mint2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
