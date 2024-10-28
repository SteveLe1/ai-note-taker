import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/utils/enum/enum.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

import 'zp_text.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class NTListTile extends StatelessWidget {
  const NTListTile(
      {this.text,
        this.textStyle,
        this.trailing,
        this.leading,
        this.onPressed,
        this.stringCase,
        super.key,
        this.margin,
        this.padding,
        this.subText,
        this.subTextStyle,
        this.iconLeading,
        this.onPressedLeading,
        this.isBorderShow = false,
        this.isSelected = false,
        this.iconLeadingColor,
        this.iconLeadingSize,
        this.color,
        this.paddingTrailing,
        this.border,
      });

  final String? text;
  final TextStyle? textStyle;
  final String? subText;
  final TextStyle? subTextStyle;
  final Widget? leading;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedLeading;
  final Widget? trailing;
  final StringCase? stringCase;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? iconLeading;
  final bool isBorderShow;
  final bool isSelected;
  final Color? iconLeadingColor;
  final double? iconLeadingSize;
  final Color? color;
  final EdgeInsets? paddingTrailing;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: border ?? Border.all(width: 1, color: isBorderShow ? isSelected ? AppColors.purpleBorder : AppColors.grey1.withOpacity(0.5) : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      padding: padding ??  EdgeInsets.symmetric(vertical: 12.h),
      margin: margin ?? EdgeInsets.only(bottom: 8.0.h),
      child: Row(
        children: [
          InkWell(
              onTap: onPressedLeading,
              child: leading ?? ZPIcon(iconLeading ?? '', width: iconLeadingSize?.w ?? 36.w, height: iconLeadingSize?.h ?? 36.h, color: iconLeadingColor,)),
          SizedBox(width: leading != null ? 10.w : 8.w),
          Expanded(
            child: GestureDetector(
              onTap: onPressed,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZPText(
                          keyText: text ?? "",
                          style: textStyle ?? TextStyles.w600Size16Black3,
                        ),
                        if (subText != null && subText!.isNotEmpty)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.h),
                              ZPText(
                                keyText: subText ?? "",
                                style: subTextStyle ?? TextStyles.w600Size12GreySubtitle,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: paddingTrailing ?? EdgeInsets.zero,
                    child: trailing ?? ZPIcon(Ics.icArrowRight, width: 36.w, height: 36.h, color: AppColors.greySearch,)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
