import 'package:flutter/material.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class ZPBackButton extends StatelessWidget {
  const ZPBackButton({Key? key, this.onBack}) : super(key: key);

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBack ?? () => appRouter.pop(context),
      child: const ZPIcon(
        Ics.icArrowLeft,
        width: 30,
        height: 30,
        color: AppColors.black1,
      ),
    );
  }
}