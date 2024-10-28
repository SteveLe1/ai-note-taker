import 'package:flutter/material.dart';
import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactActionBottomSheet extends BottomSheetCommon {
  final String friendName;
  final String title;
  final String pathIcon;

  ContactActionBottomSheet(
      {required this.friendName, required this.title, required this.pathIcon});

  @override
  Widget create(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () => hideBottomSheet(context),
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.h, top: 10.h),
                        child: ZPIcon(
                          Ics.icClose,
                          color: AppColors.black1,
                          width: 40.w,
                          height: 40.h,
                        ),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 35.w, right: 25.w),
                child: Column(
                  children: [
                    SizedBox(height: 44.h),
                    ZPIcon(
                      pathIcon,
                      color: AppColors.mint2,
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(height: 10.h),
                    ZPText(
                      keyText: title,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black3),
                    ),
                    SizedBox(height: 10.h),
                    ZPText(
                      keyText: friendName,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black5),
                    ),
                    SizedBox(height: 40.h),
                    _buildContactInfo(
                        LocaleKeys.tag_mobile_phone, "02 - 0000 - 0000"),
                    _buildContactInfo(LocaleKeys.tag_home_label, "02 - 0000 - 0000"),
                    _buildContactInfo(LocaleKeys.tag_office, "02 - 0000 - 0000"),
                    SizedBox(height: 30.h),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(String label, String phoneNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZPText(
              keyText: label,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black7)),
          const Expanded(flex: 1, child: SizedBox()),
          ZPText(
              keyText: phoneNumber,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black3)),
          SizedBox(width: 8.w),
          ZPIcon(
            Ics.icArrowRight,
            color: AppColors.black7,
            width: 20.w,
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
