import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/contact_cycle_bottom_sheet.dart';
import 'package:zippy_flutter/common/toast/toast_common.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_label_tag_rec.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/friend_detail/widgets/representative_personality_bottom_sheet.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class FriendDetailScreen extends StatefulWidget {
  const FriendDetailScreen({super.key});

  @override
  State<FriendDetailScreen> createState() => _FriendDetailScreenState();
}

class _FriendDetailScreenState extends State<FriendDetailScreen> {
  List<Tag> tags = [
    Tag("채권", AppColors.zippy1, AppColors.brightZippy1, false, ""),
    Tag("골프백돌이", AppColors.zippy2, AppColors.brightZippy2, false, ""),
    Tag("야구_기아", AppColors.zippy3, AppColors.brightZippy3, false, ""),
    Tag("딸바보", AppColors.zippy4, AppColors.brightZippy4, false, ""),
    Tag("낚시광", AppColors.zippy5, AppColors.brightZippy5, false, ""),
    Tag("새우 알레르기", AppColors.zippy6, AppColors.brightZippy6, false, ""),
    Tag("+ 새우 알레르기", AppColors.grey1, AppColors.white4, true, Ics.icPlus),
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white4,
      appBar: ZPAppBar(
          isShowDivider: true,
          context: context,
          disableLeading: false,
          centerTitle: true,
          title: LocaleKeys.friend_detail_detail_information,
          textStyle: TextStyles.w600Size17Black1,
          actionWidgets: [
            Padding(
              padding: EdgeInsets.only(right: 23.w),
              child: InkWell(
                onTap: () => appRouter.push(const SettingRoute()),
                child: ZPIcon(
                  Ics.icSetting,
                  color: AppColors.black1,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ]),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.h, bottom: 15.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 70.h),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0.2,
                                color: AppColors.white1,
                                shadowColor: AppColors.grey5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 90.h),
                                      child: const Text(
                                        '한신_최민호_실장',
                                        style: TextStyles.w700Size22Black3,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 35.h, top: 10.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ZPText(
                                            keyText: LocaleKeys.friend_detail_if_have,
                                            style: TextStyles.w400Size15Black7,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Text(
                                              '|',
                                              style: TextStyles.w400Size15Black7,
                                            ),
                                          ),
                                          ZPText(
                                            keyText: LocaleKeys.friend_detail_bring_it,
                                            style: TextStyles.w400Size15Black7,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -50.h,
                                child: Container(
                                  decoration: const BoxDecoration(color: AppColors.white1, shape: BoxShape.circle),
                                  height: 132.h,
                                  width: 132.h,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: InkWell(
                                            onTap: () => RepresentativePersonalityBottomSheet().showBottomSheet(context),
                                            child: ZPIcon(
                                              Ics.icSmile,
                                              width: 105.w,
                                              height: 105.h,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () => ContactCycleBottomSheet(onChanged: (int value) {  }).showBottomSheet(context),
                                              child: ZPIcon(
                                                Images.icVip,
                                                width: 30.w,
                                                height: 30.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0.2,
                          color: AppColors.white1,
                          shadowColor: AppColors.grey5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 30.w),
                            child: Row(
                              children: [
                                ZPText(
                                  keyText: LocaleKeys.friend_detail_one_month,
                                  style: TextStyles.w700Size18Black3,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.lightRed2,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                                      child: ZPText(
                                        keyText: LocaleKeys.friend_detail_today,
                                        style: TextStyles.w500Size11Red1,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Wrap(
                                      children: [
                                        InkWell(
                                          child: ZPIcon(
                                            Ics.icCall,
                                            color: AppColors.black1,
                                            width: 30.w,
                                            height: 30.h,
                                          ),
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: ZPIcon(
                                              Ics.icMessage,
                                              color: AppColors.black1,
                                              width: 30.w,
                                              height: 30.h,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          child: ZPIcon(
                                            Ics.icKakaotalk,
                                            color: AppColors.black1,
                                            width: 30.w,
                                            height: 30.h,
                                          ),
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.w),
                                            child: ZPIcon(
                                              Ics.icRefresh,
                                              color: AppColors.black1,
                                              width: 30.w,
                                              height: 30.h,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0.2,
                          color: AppColors.white1,
                          shadowColor: AppColors.grey5,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 30.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ZPText(
                                    keyText: LocaleKeys.friend_detail_tag,
                                    style: TextStyles.w700Size18Black3,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.start,
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: [
                                        ...tags
                                            .map((item) => ZPLabelTagRec(
                                                  color: item.bgColor ?? AppColors.black8,
                                                  textStyle: TextStyle(
                                                      fontSize: 13, color: item.colorText ?? AppColors.black8),
                                                  textLabel: item.title,
                                                  iconLeft: item.isAddIcon,
                                                  iconRes: item.iconRes,
                                                ))
                                            .toList(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Tag {
  String title = "";
  Color? colorText;
  Color? bgColor;
  bool? isAddIcon = false;
  String? iconRes = "";

  Tag(this.title, this.colorText, this.bgColor, this.isAddIcon, this.iconRes);
}
