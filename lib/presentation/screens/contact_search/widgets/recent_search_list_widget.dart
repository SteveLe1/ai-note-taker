import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/contact_cycle_bottom_sheet.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_list_tile.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class RecentSearchListWidget extends StatelessWidget {
  const RecentSearchListWidget({super.key, required this.bottomNavigationContext});

  final BuildContext bottomNavigationContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white3,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ZPListTile(
                      color: AppColors.white1,
                      leading: Container(
                        width: 44.w,
                        height: 44.h,
                        padding: EdgeInsets.all(4.0.w),
                        margin: EdgeInsets.only(left: 12.0.w),
                        decoration: const BoxDecoration(color: AppColors.black3, shape: BoxShape.circle),
                        child: ZPIcon(
                          index < 4 ? Images.vipFilter : index  % 2 == 0 ? Images.sFilter : Images.vFilter,
                          width: 36.w,
                          height: 36.h,
                        ),
                      ),
                      iconLeading: Images.vipFilter,
                      text: "경동_강찬익_실장",
                      textStyle: TextStyles.w500Size14Black6,
                      labelTag: index < 4 ? "Today" : "D-N",
                      tagStyle: index < 4 ? TextStyles.w500Size11Red1 : TextStyles.w500Size11Mint2,
                      tagColor : index < 4 ? null : AppColors.brightZippy1,
                      paddingTrailing: EdgeInsets.only(right: 20.w),
                      onPressed: () {appRouter.push(const FriendDetailRoute());},
                      onPressedLeading: () => ContactCycleBottomSheet(onChanged: (value) {
                        debugPrint("value $value");
                      }).showBottomSheet(bottomNavigationContext),
                    );
                  }))
        ],
      ),
    );
  }
}
