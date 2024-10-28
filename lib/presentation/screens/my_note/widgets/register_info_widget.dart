import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class RegisterInfoWidget extends StatelessWidget {
  final String iconLeading;
  final String labelTitle;
  final TextStyle? styleTitle;
  final String quantityPeople;
  final VoidCallback? onPressed;

  const RegisterInfoWidget({
    super.key,
    required this.iconLeading,
    required this.labelTitle,
    this.styleTitle,
    required this.quantityPeople,
    this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 15.0.h),
        padding: EdgeInsets.only(left: 25.0.w),
        decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: ZPListTile(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          iconLeading: iconLeading,
          text: labelTitle,
          textStyle: styleTitle ?? TextStyles.w700Size18Black3,
          isDividerShow: false,
          trailing: Row(
            children: [
              ZPText(
                keyText: LocaleKeys.home_people,
                namedArgs: {'quantity': quantityPeople},
                style: TextStyles.w500Size14Black8,
              ),
              SizedBox(width: 10.w,),
              ZPIcon(Ics.icArrowRight2, width: 30.w, height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
