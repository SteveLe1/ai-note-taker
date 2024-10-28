import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/domain/entities/tag.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/tag_item_widget.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class RecentSearchTags extends StatefulWidget {
  const RecentSearchTags({super.key});

  @override
  State<RecentSearchTags> createState() => _RecentSearchTagsState();
}

class _RecentSearchTagsState extends State<RecentSearchTags> {
  List<Tag> listTags = [
    const Tag(name: "채권", tagColor: TagColor.zippy10),
    const Tag(name: "야구_기아", tagColor: TagColor.zippy2),
    const Tag(name: "골프백돌이", tagColor: TagColor.zippy3),
    const Tag(name: "딸바보", tagColor: TagColor.zippy10),
    const Tag(name: "새우 알레르기", tagColor: TagColor.zippy3)
  ].toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w),
          child: Row(
            children: [
              Expanded(
                child: ZPText(
                  keyText: LocaleKeys.tag_recent_search_tags,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black3),
                ),
              ),
              listTags.isNotEmpty
                  ? ZPText(
                      keyText: LocaleKeys.tag_delete_recent_history,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black8),
                    )
                  : const SizedBox()
            ],
          ),
        ),
        listTags.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(bottom: 44.h, top: 20.0.h),
                child: SizedBox(
                  height: 36.0.h,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 25.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: listTags.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            margin:
                                EdgeInsets.only(right: 10.0.w, bottom: 10.0.h),
                            child: TagItemWidget(
                              tagText: listTags[index].name,
                              tagColor: listTags[index].tagColor,
                            ),
                          )),
                ),
              )
            : _buildNoSearchHistory()
      ],
    );
  }

  Widget _buildNoSearchHistory() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 42.h),
        child: ZPText(
          keyText: LocaleKeys.tag_delete_recent_history,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.grey1),
        ),
      ),
    );
  }
}
