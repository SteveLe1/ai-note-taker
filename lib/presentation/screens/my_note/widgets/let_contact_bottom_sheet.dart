import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/bottom_sheet/contact_cycle_bottom_sheet.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class LetContactBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  LetContactBottomSheet({required this.onChanged});

  @override
  Widget create(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
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
              padding: EdgeInsets.only(top: 30.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ZPIcon(
                    Ics.icCallHurry,
                    width: 60.w,
                    height: 60.h,
                    color: AppColors.mint2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ZPText(keyText: LocaleKeys.home_let_contact, style: TextStyles.w800Size22Black3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: ZPText(
                        keyText: LocaleKeys.home_these_are_friends_who_have_less_3_days, style: TextStyles.w500Size16Black5),
                  ),
                  Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          padding: EdgeInsets.only(left: 25.w, right: 20.w),
                          itemBuilder: (BuildContext context, int index) {
                            return ZPListTile(
                              padding: EdgeInsets.symmetric(vertical: 22.h),
                              leading: Container(
                                width: 44.w,
                                height: 44.h,
                                padding: EdgeInsets.all(4.0.w),
                                decoration: const BoxDecoration(color: AppColors.black3, shape: BoxShape.circle),
                                child: ZPIcon(
                                  index < 4
                                      ? Images.vipFilter
                                      : index % 2 == 0
                                          ? Images.sFilter
                                          : Images.vFilter,
                                  width: 36.w,
                                  height: 36.h,
                                ),
                              ),
                              text: "경동_강찬익_실장",
                              textStyle: TextStyles.w500Size14Black6,
                              labelTag: index < 4 ? "Today" : "D-N",
                              tagStyle: index < 4 ? TextStyles.w500Size11Red1 : TextStyles.w500Size11Mint2,
                              tagColor: index < 4 ? null : AppColors.brightZippy1,
                              onPressed: () => appRouter.push(const FriendDetailRoute()),
                              onPressedLeading: () => ContactCycleBottomSheet(onChanged: (value) {
                                debugPrint("value $value");
                              }).showBottomSheet(context),
                            );
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCycle {
  const ContactCycle({required this.imageIcon, required this.title});

  final String imageIcon;
  final String title;
}
