import 'package:flutter/material.dart';
import 'package:zippy_flutter/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:zippy_flutter/common/toast/toast_common.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/common/widgets/zp_textfield.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class AddTagBottomSheet extends BottomSheetCommon {

  List<Color> colorList = const [
    AppColors.zippy1,
    AppColors.zippy2,
    AppColors.zippy3,
    AppColors.zippy4,
    AppColors.zippy5,
    AppColors.zippy6,
    AppColors.zippy7,
    AppColors.zippy8,
    AppColors.zippy9,
    AppColors.zippy10
  ];
  int selectedIndex = 8;

  @override
  Widget create(BuildContext context) {
    return Container(
      height: 464,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => hideBottomSheet(context),
                          child: ZPIcon(
                            Ics.icClose,
                            color: AppColors.black1,
                            width: 40.w,
                            height: 40.h,
                          ))
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ZPText(keyText: "태그 수정 / 삭제", style: TextStyles.w800Size22Black3),
                  ),
                  const ZPTextField(
                    textStyle: TextStyles.w500Size17Black3,
                    hintText: LocaleKeys.tag_hint_add_tag_text_field,
                    hintStyle: TextStyles.w500Size17Grey2,
                    noBorder: true,
                    fillColor: AppColors.white1,
                  ),
                  Divider(thickness: 2.h, color: AppColors.black3),
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
                    child: ZPText(keyText: "그룹 색상을 선택해주세요.", style: TextStyles.w500Size16Black5,),
                  ),
                  Expanded(
                    child: StatefulBuilder(builder: (context, setStateChild) {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // number of items per row
                          crossAxisCount: 5,
                          // vertical spacing between the items
                          mainAxisSpacing: 15.h,
                          // horizontal spacing between the items
                          crossAxisSpacing: 29.w,
                        ),
                        // number of items in your list
                        itemCount: colorList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: index == 0
                                ? null
                                : () => setStateChild(() {
                              selectedIndex = index;
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: index == 0 ? colorList[index].withOpacity(0.3) : colorList[index]),
                              padding: EdgeInsets.all(8.w.h),
                              child: ZPIcon(
                                index == 0 ? Ics.icClose : Ics.icCheck,
                                color: index == 0
                                    ? AppColors.black1.withOpacity(0.3)
                                    : selectedIndex == index
                                    ? AppColors.white1
                                    : Colors.transparent,
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  ZPButton(
                    text: "신규 추가",
                    textStyle: TextStyles.w600Size16White1,
                    color: AppColors.black1,
                    onPressed: () {
                      appRouter.pop();
                      ToastCommon.showDIToast("Coming soon");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}