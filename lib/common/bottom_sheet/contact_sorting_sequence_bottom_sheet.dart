import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:zippy_flutter/common/toast/toast_common.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_list_tile.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class ContactSortingSequenceBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  ContactSortingSequenceBottomSheet({required this.onChanged});

  List<String> listContactSort = [
    LocaleKeys.contact_list_sort_by_upcoming_contact_date,
    LocaleKeys.contact_list_sort_by_highest_level,
    LocaleKeys.contact_list_sort_by_lowest_level,
    LocaleKeys.contact_list_sort_by_newest_granting_level,
    LocaleKeys.contact_list_sort_by_oldest_granting_level
  ];
  int selectedIndex = 0;

  @override
  Widget create(BuildContext context) {
    return Container(
      height: 517.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(25.w, 50.h, 13.w, 30.h),
      decoration: const BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: StatefulBuilder(builder: (context, setStateChild) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: ZPText(keyText: LocaleKeys.contact_list_sorting_sequence, style: TextStyles.w800Size22Black3),
            ),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: listContactSort.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ZPListTile(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        leading: const SizedBox(),
                        trailing: ZPIcon(
                          Ics.icCheckCircle,
                          width: 32.w,
                          height: 32.h,
                          color: selectedIndex == index ? null : Colors.transparent,
                        ),
                        text: listContactSort[index],
                        textStyle: selectedIndex == index ? TextStyles.w600Size14Mint2 : TextStyles.w500Size14Black6,
                        onPressed: () {
                          setStateChild(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    })),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  ZPButton(
                      width: 106.w,
                      text: LocaleKeys.cancel,
                      textStyle: TextStyles.w600Size16Black8,
                      color: AppColors.white4,
                      onPressed: () => appRouter.pop()),
                  SizedBox(width: 12.w),
                  Expanded(
                      child: ZPButton(
                          text: LocaleKeys.apply,
                          textStyle: TextStyles.w600Size16White1,
                          color: AppColors.black3,
                          onPressed: () {
                            onChanged(selectedIndex);
                            ToastCommon.showDIToast("Coming soon");
                            appRouter.pop();
                          }))
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ContactCycle {
  const ContactCycle({required this.imageIcon, required this.title});

  final String imageIcon;
  final String title;
}
