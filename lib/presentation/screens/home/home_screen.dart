import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/toast/toast_common.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_app_bar.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_search_textfield.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/home/widgets/contact_info_widget.dart';
import 'package:coconut_note/presentation/screens/home/widgets/even_now_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/home/widgets/let_contact_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/home/widgets/new_registration_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/home/widgets/register_info_widget.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.bottomNavigationContext});

  final BuildContext bottomNavigationContext;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
        context: context,
        disableLeading: true,
        titleWidget: Padding(
          padding: EdgeInsets.only(left: 25.0.w),
          child: ZPIcon(
            Images.zippyLite,
            width: 116.w,
            height: 36.h,
          ),
        ),
        actionWidgets: [
          Padding(
            padding: EdgeInsets.only(right: 15.0.w),
            child: Row(
              children: [
                InkWell(
                    onTap: () => appRouter.push(const NotificationCenterRoute()),
                    child: ZPIcon(Ics.icNotie, width: 30.w, height: 30.h)),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () => appRouter.push(const SettingRoute()),
                  child: ZPIcon(
                    Ics.icSetting,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white1,
              padding: EdgeInsets.all(15.0.h),
              child:  InkWell(
                onTap: () => AutoRouter.of(context).push(ContactSearchRoute(bottomNavigationContext: widget.bottomNavigationContext)),
                child: const IgnorePointer(
                  child: ZPSearchTextField(
                    hintText: LocaleKeys.home_hint_search,
                    readOnly: true,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: AppColors.white3,
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ContactInfoWidget(
                    iconCircle: Ics.icCallHurry,
                    labelTitle: LocaleKeys.home_let_contact,
                    labelSubTitle: LocaleKeys.home_these_are_friends_who_have,
                    quantityPeople: "10",
                    onPressed: () => LetContactBottomSheet(onChanged: (value) {
                      debugPrint("value $value");
                    }).showBottomSheet(widget.bottomNavigationContext),
                  ),
                  ContactInfoWidget(
                    iconCircle: Ics.icLate,
                    labelTitle: LocaleKeys.home_it_not_too_late,
                    labelSubTitle: LocaleKeys.home_these_are_friends_whose_contact,
                    quantityPeople: "4",
                    onPressed: () => EvenNowBottomSheet(onChanged: (value) {
                      debugPrint("value $value");
                    }).showBottomSheet(widget.bottomNavigationContext),
                  ),
                  RegisterInfoWidget(
                    iconLeading: Ics.icContact,
                    labelTitle: LocaleKeys.home_new_registration_contact_information,
                    quantityPeople: "32",
                    onPressed: () => NewRegistrationBottomSheet(onChanged: (value) {
                      debugPrint("value $value");
                    }).showBottomSheet(widget.bottomNavigationContext),
                  ),
                  RegisterInfoWidget(
                      iconLeading: Ics.icUsers,
                      labelTitle: LocaleKeys.home_contact_cycle_not_specified,
                      quantityPeople: "187",
                      onPressed: () {
                        AutoTabsRouter.of(context).setActiveIndex(1);
                      }),
                  Padding(padding: EdgeInsets.only(top: 32.h, bottom: 25.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.black4,
                        borderRadius: BorderRadius.circular(31)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Padding(padding: EdgeInsets.only(left: 32.w, right: 22.w),
                        child: const ZPIcon(Ics.icCrownFill, color: AppColors.mint1,)
                        ),
                          Expanded(child: ZPText(keyText: "프리미엄 플랜", style: TextStyles.w600Size14Mint1,)),
                          Container(
                            width: 29.w,
                            height: 29.h,
                            margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                            padding: EdgeInsets.all(3.w.h),
                            decoration: const BoxDecoration(
                              color: AppColors.mint1,
                              shape: BoxShape.circle
                            ),
                            child: const ZPIcon(Ics.icArrowRight2),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
