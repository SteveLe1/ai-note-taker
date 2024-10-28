import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_floating_action.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class ZPFloatingActionButton extends StatelessWidget {
  const ZPFloatingActionButton({super.key, this.onPressAddTag, this.onPressAddGroup, this.onPressEditAll});
  final VoidCallback? onPressAddTag;
  final VoidCallback? onPressAddGroup;
  final VoidCallback? onPressEditAll;

  @override
  Widget build(BuildContext context) {
    return ZPExpandableFab(
      overlayStyle: ExpandableFabOverlayStyle(
        color: AppColors.black1.withOpacity(0.5),
        // blur: 5,
      ),
      children: [
        expandedAction(onPressed: onPressEditAll, labelText: "Edit all", icon: Ics.icEdit),
        expandedAction(onPressed: onPressAddGroup, labelText: "Add group", icon: Ics.icGroupPlus),
        expandedAction(onPressed: onPressAddTag, labelText: "Add tag", icon: Ics.icTagPlus),
      ],
    );
  }
  Widget expandedAction({VoidCallback? onPressed, required String labelText, required String icon}){
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          ZPText(
            keyText: labelText,
            style: TextStyles.w600Size15White1,
          ),
          SizedBox(
            width: 15.w,
          ),
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: AppColors.white1, borderRadius: BorderRadius.circular(15)),
            child: ZPIcon(icon),
          )
        ],
      ),
    );
  }

}
