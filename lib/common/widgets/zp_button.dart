import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

import 'zp_icon.dart';
import 'zp_text.dart';

class ZPButton extends StatelessWidget {
  const ZPButton({
    required this.text,
    this.textStyle,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.disabled = false,
    this.radius = 20,
    this.gradient,
    this.iconRight,
    Key? key,
    this.borderColor,
    this.disableColor,
    this.padding,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double radius;
  final bool disabled;
  final LinearGradient? gradient;
  final String? iconRight;
  final Color? disableColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height ?? 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: gradient,
          ),
          child: ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              padding: padding,
              elevation: 0,
              disabledBackgroundColor: disableColor ?? AppColors.white1,
              backgroundColor:
                  gradient == null ? color ?? (disabled ? (disableColor ?? AppColors.white1) : AppColors.mint2) : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZPText(
                  keyText: text,
                  style: textStyle ??
                      (disabled
                          ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey3)
                          : const TextStyle(fontSize: 16, color: AppColors.black3)),
                ),
                if (iconRight != null)
                  Row(
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      ZPIcon(
                        iconRight!,
                        width: 18.w,
                        color: AppColors.black3,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
