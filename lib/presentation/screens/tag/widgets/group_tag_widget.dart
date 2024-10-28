import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/tag_item_widget.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class GroupTagWidget extends StatelessWidget {
  const GroupTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0.h),
      decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(15),
          border: Border(
            left: BorderSide(color: AppColors.zippy10, width: 18.0.w),
          )),
      padding: EdgeInsets.only(
          left: 5.0.w, right: 15.0.w, bottom: 5.0.h, top: 15.0.h),
      child: Wrap(
        children: [
          for (int i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
            const TagItemWidget(tagText: "채권", tagColor: TagColor.zippy10)
        ],
      ),
    );
  }
}
