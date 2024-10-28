import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

Future<T?> showCustomDialog<T>(
    BuildContext context, {
      required List<Widget> children,
      Color? backgroundColor,
      EdgeInsets? padding,
      EdgeInsets? insetPadding,
      bool barrierDismissible = true,
    }) async {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return ZPDialog(
          backgroundColor: backgroundColor ?? AppColors.white1,
          padding: padding,
          insetPadding: insetPadding,
          children: children,
        );
      });
}

class ZPDialog extends StatelessWidget {
  const ZPDialog(
      {required this.children,
        Key? key,
        this.backgroundColor,
        this.padding,
        this.isSuccessDialog = false,
        this.insetPadding})
      : super(key: key);

  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? insetPadding;
  final bool isSuccessDialog;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: insetPadding ??
           EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
      child: GestureDetector(
        onTap: () {
          if (isSuccessDialog) Navigator.pop(context);
        },
        child: Container(
          width: 1000,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor ?? AppColors.black1.withOpacity(0.5),
          ),
          padding: padding ??
               EdgeInsets.only(top: 40.h, bottom: 20.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}