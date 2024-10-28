import 'package:auto_route/auto_route.dart';
import 'package:coconut_note/common/bottom_sheet/contact_cycle_bottom_sheet.dart';
import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_list_tile.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/new_note_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/tag/widgets/recent_search_tags_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
class MyNoteScreen extends StatefulWidget {
  const MyNoteScreen({super.key});

  @override
  State<MyNoteScreen> createState() => _MyNoteScreenState();
}

class _MyNoteScreenState extends State<MyNoteScreen> {

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => appRouter.push(const SettingRoute()),
                      child: ZPIcon(
                        Ics.icSetting,
                        width: 36.w,
                        height: 36.h,
                      ),
                    ),
                  ),
                  ZPText(keyText: 'My Notes', style: TextStyles.w700Size32Black3),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0.h),
                    child: InkWell(
                      onTap: () => AutoRouter.of(context).push(ContactSearchRoute(bottomNavigationContext:context)),
                      child: const IgnorePointer(
                        child: ZPSearchTextField(
                          hintText: "Search notes and transcripts",
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
                  const RecentSearchTags(),
                  Expanded(
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return NTListTile(
                            color: AppColors.white1,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            leading: Container(
                              width: 44.w,
                              height: 44.h,
                              padding: EdgeInsets.all(4.0.w),
                              margin: EdgeInsets.only(left: 16.0.h),
                              decoration: const BoxDecoration(color: AppColors.lightPurple, shape: BoxShape.circle),
                              child: ZPIcon( Images.coconutLogo,
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                            text: "Welcome! Here's how to get the most out of Coconote",
                            subText: "24 Oct 2024",
                            onPressed: () {},
                            onPressedLeading: () => NewRegistrationBottomSheet(onChanged: (value) {
                              debugPrint("value $value");
                            }).showBottomSheet(context),
                            paddingTrailing : EdgeInsets.only(right: 8.0.h),
                          );
                        }),
                  )
                ],
              ),
            ),
             Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.0.h),
                child: ZPButton(
                  text: "New Note",
                  textStyle: TextStyles.w600Size16White1,
                  width: 140.w,
                  radius: 100,
                  color: AppColors.orangeButton,
                  onPressed: () {
                    NewNoteBottomSheet(onChanged: (value) {
                      debugPrint("value $value");
                    }).showBottomSheet(context);
                  },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
