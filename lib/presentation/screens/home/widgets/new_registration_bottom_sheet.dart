import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_list_tile.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class NewRegistrationBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  NewRegistrationBottomSheet({required this.onChanged});

  @override
  Widget create(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
                    Ics.icContact,
                    width: 60.w,
                    height: 60.h,
                    color: AppColors.mint2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ZPText(keyText: LocaleKeys.home_new_registered_number, style: TextStyles.w800Size22Black3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: ZPText(keyText: LocaleKeys.home_please_set_the_contact_cycle, style: TextStyles.w500Size16Black5),
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
                                  Images.minusFilter,
                                  width: 36.w,
                                  height: 36.h,
                                ),
                              ),
                              text: index % 2 == 0 ? "유큐어_이해찬_실장" : "안재현",
                              textStyle: TextStyles.w500Size14Black6,
                              labelTag: "미지정",
                              tagStyle: TextStyles.w500Size11Black8,
                              tagColor: AppColors.white4,
                              onPressed: () => appRouter.push(const FriendDetailRoute()),
                              onPressedLeading: () {},
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
