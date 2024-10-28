import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_label_tag.dart';
import 'package:coconut_note/utils/enum/enum.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

import 'zp_text.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class ZPListTile extends StatelessWidget {
  const ZPListTile(
      {this.text,
        this.textStyle,
        this.trailing,
        this.leading,
        this.onPressed,
        this.stringCase,
        Key? key,
        this.padding,
        this.subText,
        this.subTextStyle,
        this.iconLeading,
        this.labelTag,
        this.onPressedLeading,
        this.onPressedTag,
        this.tagColor,
        this.isDividerShow = true,
        this.iconLeadingColor,
        this.iconLeadingSize,
        this.tagStyle,
        this.color,
        this.paddingTrailing,
      })
      : super(key: key);

  final String? text;
  final String? labelTag;
  final TextStyle? textStyle;
  final String? subText;
  final TextStyle? subTextStyle;
  final Widget? leading;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedLeading;
  final VoidCallback? onPressedTag;
  final Widget? trailing;
  final StringCase? stringCase;
  final EdgeInsets? padding;
  final String? iconLeading;
  final Color? tagColor;
  final bool isDividerShow;
  final Color? iconLeadingColor;
  final double? iconLeadingSize;
  final TextStyle? tagStyle;
  final Color? color;
  final EdgeInsets? paddingTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(width: 1, color: isDividerShow ? AppColors.white4 : Colors.transparent),
        ),
      ),
      child: Row(
        children: [
          InkWell(
              onTap: onPressedLeading,
              child: leading ?? ZPIcon(iconLeading ?? '', width: iconLeadingSize?.w ?? 36.w, height: iconLeadingSize?.h ?? 36.h, color: iconLeadingColor,)),
          SizedBox(width: leading != null ? 10.w : 8.w),
          Expanded(
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: padding ??  EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ZPText(
                            keyText: text ?? "",
                            style: textStyle ?? TextStyles.w500Size14Black6,
                          ),
                          if (subText != null)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 6.h),
                                ZPText(
                                  keyText: subText ?? "",
                                  style: subTextStyle ?? TextStyles.w500Size14Black6,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onPressedTag,
                      splashColor: Colors.transparent,
                      child: Padding(
                        padding: paddingTrailing ?? EdgeInsets.zero,
                        child: trailing ?? Row(
                          children: [
                            ZPLabelTag(textLabel: labelTag ?? "", color: tagColor, textStyle: tagStyle),
                            SizedBox(width: 5.w,),
                            ZPIcon(Ics.icArrowRight, width: 20.w, height: 20.h, color: AppColors.grey1,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
