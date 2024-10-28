import 'package:coconut_note/presentation/screens/my_note/widgets/folders_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/domain/entities/tag.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/tag/widgets/tag_item_widget.dart';
import 'package:coconut_note/utils/enum/enum.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class RecentSearchTags extends StatefulWidget {
  const RecentSearchTags({super.key});

  @override
  State<RecentSearchTags> createState() => _RecentSearchTagsState();
}

class _RecentSearchTagsState extends State<RecentSearchTags> {
  List<Tag> listTags = [
    const Tag(name: "All notes", tagColor: TagColor.zippy10),
    const Tag(name: "View folders", tagColor: TagColor.zippy2),
  ].toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTags.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: SizedBox(
                  height: 36.0.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listTags.length,
                      itemBuilder: (BuildContext context, int index) =>
                          TagItemWidget(
                            isShowBorder: index == 0 ? true : false,
                            tagText: listTags[index].name,
                            tagColor: listTags[index].tagColor,
                            onPressed: index == 0 ? null : () => FoldersBottomSheet(onChanged: (value) {
                              debugPrint("value $value");
                            }).showBottomSheet(context),
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
