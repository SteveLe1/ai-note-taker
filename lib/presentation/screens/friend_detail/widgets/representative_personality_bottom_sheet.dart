import 'package:flutter/material.dart';
import 'package:zippy_flutter/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:zippy_flutter/common/toast/toast_common.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/domain/entities/personality.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/friend_detail/widgets/personality_item_widget.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepresentativePersonalityBottomSheet extends BottomSheetCommon {
  @override
  Widget create(BuildContext context) {
    final List<Personality> personalities = EnumPersonality.values
        .map((e) => Personality(name: e.name, pathIcon: e.pathIcon))
        .toList();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0.h, left: 25.0.h),
                child: ZPText(
                  keyText: LocaleKeys.setting_representative_personality,
                  style: const TextStyle(
                      color: AppColors.black3,
                      fontWeight: FontWeight.w800,
                      fontSize: 22),
                ),
              ),
              SizedBox(height: 11.0.h),
              Container(
                margin: EdgeInsets.only(left: 30.0.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: personalities
                            .map((e) => PersonalityItemWidget(
                                pathIcon: e.pathIcon, name: e.name))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 25.0.w, right: 25.0.w, top: 40.0.h, bottom: 30.0.h),
                child: Row(
                  children: [
                    ZPButton(
                      radius: 20,
                      width: 98.0.w,
                      height: 58.0.h,
                      text: LocaleKeys.cancel,
                      color: AppColors.white4,
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black8),
                      onPressed: () => appRouter.pop(),
                    ),
                    SizedBox(width: 15.0.w),
                    Expanded(
                      child: ZPButton(
                        radius: 20,
                        height: 58.0.h,
                        text: LocaleKeys.apply,
                        color: AppColors.black3,
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1),
                        onPressed: () {
                          ToastCommon.showDIToast("Coming soon");
                          appRouter.pop();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
