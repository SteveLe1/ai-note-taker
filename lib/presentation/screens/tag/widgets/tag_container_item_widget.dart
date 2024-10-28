import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/domain/entities/tag.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/tag/widgets/tag_item_widget.dart';
import 'package:coconut_note/utils/enum/enum.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class TagContainerItemWidget extends StatelessWidget {
  final TagColor tagColor;

  const TagContainerItemWidget({super.key, required this.tagColor});

  @override
  Widget build(BuildContext context) {
    List<Tag> listTags = [
      const Tag(name: "채권", tagColor: TagColor.zippy10),
      const Tag(name: "야구_기아", tagColor: TagColor.zippy2),
      const Tag(name: "골프백돌이", tagColor: TagColor.zippy3),
      const Tag(name: "딸바보", tagColor: TagColor.zippy10),
      const Tag(name: "새우 알레르기", tagColor: TagColor.zippy3)
    ].toList();
    return Container(
      margin: EdgeInsets.only(top: 15.0.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.white4, width: 1.0.h)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border(
              left: BorderSide(color: tagColor.mainColor, width: 18.0.w),
            )),
        padding: EdgeInsets.only(
            left: 15.0.w, right: 15.0.w, bottom: 19.0.h, top: 19.0.h),
        child: listTags.isNotEmpty
            ? Wrap(
                children: listTags
                    .map((e) => Container(
                        margin: EdgeInsets.only(right: 10.0.w, bottom: 10.0.h),
                        child:
                            TagItemWidget(tagText: e.name, tagColor: tagColor)))
                    .toList(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 27.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZPIcon(Ics.icPlus,
                        color: AppColors.grey1, width: 18.w, height: 18.w),
                    SizedBox(width: 9.2.w),
                    ZPText(
                      keyText: LocaleKeys.add_tag,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey1),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
