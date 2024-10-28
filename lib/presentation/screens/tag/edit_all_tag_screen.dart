import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/add_group_bottom_sheet.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/add_tag_bottom_sheet.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/add_tag_item_widget.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/edit_delete_group_bottom_sheet.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/edit_delete_tag_bottom_sheet.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/tag_item_widget.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class EditAllTagScreen extends StatefulWidget {
  const EditAllTagScreen({super.key, required this.bottomNavigationContext});

  final BuildContext bottomNavigationContext;

  @override
  State<EditAllTagScreen> createState() => _EditAllTagScreenState();
}

class _EditAllTagScreenState extends State<EditAllTagScreen> {
  bool isCheckBox = false;

  List<ColorGroupTag> colorGroupList = [
    const ColorGroupTag(
        groupTagColor: AppColors.zippy10,
        labelTagStyle: TextStyles.w500Size13Zippy10,
        tagColor: AppColors.brightZippy10),
    const ColorGroupTag(
        groupTagColor: AppColors.zippy2, labelTagStyle: TextStyles.w500Size13Zippy2, tagColor: AppColors.brightZippy2),
    const ColorGroupTag(
        groupTagColor: AppColors.zippy3, labelTagStyle: TextStyles.w500Size13Zippy3, tagColor: AppColors.brightZippy3),
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      appBar: ZPAppBar(
        context: context,
        leadingWidget: const AutoLeadingButton(),
        title: "태그 관리",
        textStyle: TextStyles.w600Size17Black3,
        centerTitle: true,
      ),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.h,
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: colorGroupList.length + 1,
                  itemBuilder: (context, index) {
                    return index < colorGroupList.length
                        ? Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1,
                                borderRadius: BorderRadius.circular(15),
                                border: Border(
                                  left: BorderSide(color: colorGroupList[index].groupTagColor, width: 18.0.w),
                                )),
                            margin: EdgeInsets.only(bottom: 15.0.h),
                            padding: EdgeInsets.only(left: 5.0.w, right: 15.0.w, bottom: 5.0.h, top: 15.0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    children: [
                                      InkWell(
                                          onTap: () => EditDeleteTagBottomSheet(onChanged: (value) {
                                                debugPrint("value $value");
                                              }).showBottomSheet(widget.bottomNavigationContext),
                                          child: const TagItemWidget(tagText: "채권", tagColor: TagColor.zippy10)),
                                      AddTagItemWidget(
                                        onPressed: () =>
                                            AddTagBottomSheet().showBottomSheet(widget.bottomNavigationContext),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 12.w),
                                  child: InkWell(
                                    onTap: () {
                                      EditDeleteGroupBottomSheet(onChanged: (value) {
                                        debugPrint("value $value");
                                      }).showBottomSheet(widget.bottomNavigationContext);
                                    },
                                    child: ZPIcon(
                                      Ics.icEdit,
                                      width: 20.w,
                                      height: 20.h,
                                      color: AppColors.grey1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () => AddGroupBottomSheet(onChanged: (value) {
                              debugPrint("value $value");
                            }).showBottomSheet(widget.bottomNavigationContext),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 21.h),
                                decoration: BoxDecoration(
                                    color: AppColors.white1,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.white4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ZPIcon(
                                      Ics.icPlus,
                                      width: 18.w,
                                      height: 18.h,
                                    ),
                                    SizedBox(width: 5.w),
                                    ZPText(
                                      keyText: "그룹 추가",
                                      style: TextStyles.w600Size14Black5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

class ColorGroupTag {
  final Color groupTagColor;
  final TextStyle labelTagStyle;
  final Color tagColor;

  const ColorGroupTag({required this.groupTagColor, required this.labelTagStyle, required this.tagColor});
}
