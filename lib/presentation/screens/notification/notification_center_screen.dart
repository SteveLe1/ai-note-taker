import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class NotificationCenterScreen extends StatefulWidget {
  const NotificationCenterScreen({super.key});

  @override
  State<NotificationCenterScreen> createState() => _NotificationCenterScreenState();
}

class _NotificationCenterScreenState extends State<NotificationCenterScreen> {
  List<String> category = [
    LocaleKeys.notification_center_all,
    LocaleKeys.notification_center_let_contact,
    LocaleKeys.notification_center_notice_event
  ];
  int chooseCategory = 0;

  List<ItemNotification> listNotification = ItemNotification.getList();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      appBar: ZPAppBar(
        context: context,
        title: LocaleKeys.notification_center_title_app_bart,
        centerTitle: true,
        textStyle: TextStyles.w600Size17Black1,
        backgroundColor: AppColors.white1,
        isShowDivider: true,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32.h,
              margin: EdgeInsets.all(20.w),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: ZPButton(
                        text: category[index],
                        radius: 15,
                        textStyle: chooseCategory == index ? TextStyles.w500Size14White1 : TextStyles.w500Size14Black4,
                        height: 32.h,
                        color: chooseCategory == index ? AppColors.black3 : AppColors.white1,
                        borderColor: chooseCategory == index ? AppColors.black3 : AppColors.white4,
                        onPressed: () {
                          setState(() {
                            chooseCategory = index;
                          });
                        },
                      ),
                    );
                  }),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    itemCount: listNotification.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white1,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                                child: ClipOval(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2,
                                            color: listNotification[index].isCall == true
                                                ? AppColors.mint1
                                                : AppColors.black8)),
                                    child: Center(
                                        child: ZPIcon(
                                      listNotification[index].icon,
                                      color:
                                          listNotification[index].isCall == true ? AppColors.mint1 : AppColors.black8,
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 15.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(right: 10.w),
                                              child: ZPText(
                                                style: TextStyles.w400Size12Black8,
                                                keyText: listNotification[index].title,
                                              ),
                                            ),
                                            ZPText(
                                              style: TextStyles.w400Size14Black3,
                                              keyText: listNotification[index].description,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.w, top: 20.h),
                                      child: ZPText(
                                        style: TextStyles.w400Size11Grey1,
                                        keyText: DateFormat('yyyy.MM.dd').format(listNotification[index].time),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class ItemNotification {
  String icon;
  String title;
  String description;
  DateTime time;
  bool isCall;

  ItemNotification(this.icon, this.title, this.description, this.time, this.isCall);

  static List<ItemNotification> getList() {
    List<ItemNotification> list = [];
    list.add(ItemNotification(Ics.icCall, "오늘 연락할 친구를 확인하세요!", "연락해요 4명, 이제라도 7명", DateTime.now(), true));
    list.add(ItemNotification(
        Ics.icList, "오늘 연락할 친구를 확인하세요!", "공지사항 제목을 보여주는 영역입니다.\n두 줄 이상일 때 보여지는 컴포넌트", DateTime.now(), false));
    list.add(ItemNotification(Ics.icCall, "오늘 연락할 친구를 확인하세요!", "연락해요 4명, 이제라도 7명", DateTime.now(), true));
    list.add(ItemNotification(Ics.icCall, "오늘 연락할 친구를 확인하세요!", "연락해요 4명, 이제라도 7명", DateTime.now(), true));
    list.add(ItemNotification(
        Ics.icList, "오늘 연락할 친구를 확인하세요!", "공지사항 제목을 보여주는 영역입니다.\n두 줄 이상일 때 보여지는 컴포넌트", DateTime.now(), false));
    list.add(ItemNotification(
        Ics.icList, "오늘 연락할 친구를 확인하세요!", "공지사항 제목을 보여주는 영역입니다.\n두 줄 이상일 때 보여지는 컴포넌트", DateTime.now(), false));
    list.add(ItemNotification(Ics.icCall, "오늘 연락할 친구를 확인하세요!", "연락해요 4명, 이제라도 7명", DateTime.now(), true));
    list.add(ItemNotification(
        Ics.icList, "오늘 연락할 친구를 확인하세요!", "공지사항 제목을 보여주는 영역입니다.\n두 줄 이상일 때 보여지는 컴포넌트", DateTime.now(), false));

    return list;
  }
}
