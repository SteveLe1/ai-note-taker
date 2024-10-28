import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/contact_cycle_bottom_sheet.dart';
import 'package:zippy_flutter/common/shimmer/contact_shimmer.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_list_tile.dart';
import 'package:zippy_flutter/common/widgets/zp_search_textfield.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/contact_list/widgets/filter_widget.dart';
import 'package:zippy_flutter/presentation/screens/contact_list/widgets/total_friends_widget.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key, required this.bottomNavigationContext});

  final BuildContext bottomNavigationContext;

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  bool isRefresh = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
        context: context,
        disableLeading: true,
        titleWidget: Padding(
          padding: EdgeInsets.only(left: 25.0.w),
          child: ZPText(
            keyText: LocaleKeys.contact_list_list,
            style: TextStyles.w700Size25Black3,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: height < 480
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Column(children: [
                        InkWell(
                          onTap: () => AutoRouter.of(context)
                              .push(ContactSearchRoute(bottomNavigationContext: widget.bottomNavigationContext)),
                          child: const IgnorePointer(
                            child: ZPSearchTextField(
                              hintText: LocaleKeys.home_hint_search,
                              readOnly: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0.h),
                          child: const Divider(
                            color: AppColors.white4,
                            height: 1,
                          ),
                        ),
                        const FilterWidget(),
                        TotalFriendsWidget(
                          bottomNavigationContext: widget.bottomNavigationContext,
                          valueChangedRefresh: (bool value) {
                            setState(() {
                              isRefresh = value;
                            });
                          },
                        ),
                      ]),
                      isRefresh
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
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
                                  onPressed: () {},
                                  onPressedLeading: () => ContactCycleBottomSheet(onChanged: (value) {
                                    debugPrint("value $value");
                                  }).showBottomSheet(widget.bottomNavigationContext),
                                );
                              })
                          : const ContactShimmerItem()
                    ],
                  ),
                )
              : Column(
                  children: [
                    InkWell(
                      onTap: () => AutoRouter.of(context)
                          .push(ContactSearchRoute(bottomNavigationContext: widget.bottomNavigationContext)),
                      child: const IgnorePointer(
                        child: ZPSearchTextField(
                          hintText: LocaleKeys.home_hint_search,
                          readOnly: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0.h),
                      child: const Divider(
                        color: AppColors.white4,
                        height: 1,
                      ),
                    ),
                    const FilterWidget(),
                    TotalFriendsWidget(
                      bottomNavigationContext: widget.bottomNavigationContext,
                      valueChangedRefresh: (bool value) {
                        setState(() {
                          isRefresh = value;
                        });
                      },
                    ),
                    Expanded(
                        child: isRefresh
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
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
                                    onPressed: () {
                                      appRouter.push(const FriendDetailRoute());
                                    },
                                    onPressedLeading: () => ContactCycleBottomSheet(onChanged: (value) {
                                      debugPrint("value $value");
                                    }).showBottomSheet(widget.bottomNavigationContext),
                                  );
                                })
                            : const ContactShimmerItem())
                  ],
                ),
        ),
      ),
    );
  }
}
