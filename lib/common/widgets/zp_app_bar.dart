import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_back_button.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class ZPAppBar extends AppBar {
  ZPAppBar({
    String? title,
    TextStyle? textStyle,
    bool disableLeading = false,
    bool isShowDivider = false,
    bool? centerTitle,
    EdgeInsets? paddingLeading,
    Color? backgroundColor,
    VoidCallback? onBack,
    required BuildContext context,
    Widget? titleWidget,
    Widget? leadingWidget,
    List<Widget>? actionWidgets,
    Key? key,
  }) : super(
    backgroundColor: backgroundColor ?? AppColors.white1,
    surfaceTintColor: AppColors.white1,
    shadowColor: backgroundColor,
    centerTitle: centerTitle ?? false,
    automaticallyImplyLeading: false,
    leadingWidth: disableLeading ? 0 : 120.w,
    elevation: 0,
    titleSpacing: 0,
    leading: disableLeading
        ? const SizedBox()
        : Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 8.w),
        child: leadingWidget ??
            ZPBackButton(
              onBack: onBack,
            )),
    actions: actionWidgets,
    title: titleWidget ??
        ZPText(
          keyText: title ?? "",
          style: textStyle,
        ),
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.grey6,
          height: isShowDivider ? 1.0 : 0,
        )),
    key: key,
  );
}