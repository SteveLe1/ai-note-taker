import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/setting/widgets/event_notice_item_widget.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class EventNoticeDetailScreen extends StatefulWidget {
  const EventNoticeDetailScreen({super.key});

  @override
  State<EventNoticeDetailScreen> createState() => _EventNoticeDetailScreenState();
}

class _EventNoticeDetailScreenState extends State<EventNoticeDetailScreen> {
  String content = "Woo woo woo woo oohWoo woo woo wooStay in the middleLike you a littleDon't want no riddle말해줘 say it backOh say it ditto아침은 너무 멀어So say it ditto훌쩍 커버렸어함께한 기억처럼널 보는 내 마음은어느새 여름 지나 가을기다렸지 all this timeDo you want somebodyLike I want somebody날 보고 웃었지만Do you think about me now yeahAll the time yeahAll the timeI got no time to lose내 길었던 하루난 보고 싶어Ra-ta-ta-ta 울린 심장 (Ra-ta-ta-ta)I got nothing to lose널 좋아한다고 wooah wooah wooahRa-ta-ta-ta 울린 심장 (Ra-ta-ta-ta)But I don't want toStay in the middleLike you a littleDon't want no riddle";
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      appBar: ZPAppBar(context: context, title: LocaleKeys.event_notice_title_app_bar, textStyle: TextStyles.w600Size17Black1,backgroundColor: AppColors.white1, centerTitle: true, isShowDivider: true,),
      child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          EventNoticeItemWidget(time: "2023.10.29", title: "Ditto - New Jeans"),
                          ZPIcon(Images.detailEventNotice, width: MediaQuery.of(context).size.width, height: 334.h, fit: BoxFit.fill,),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                            child: ZPText(style: TextStyles.w400Size15Black5, keyText: content,),
                          ),
                        ],
                      )
                  )
              ),

              Padding(
                padding: EdgeInsets.only(left: 85.w, right: 85.w, bottom: 30.h, top: 40.h),
                child: ZPButton(text: LocaleKeys.event_notice_view_list, textStyle: TextStyles.w600Size16White1, color: AppColors.black5,
                  onPressed: () {
                    appRouter.pop(context);
                  }
                ),
              )
            ],
          )
      ),
    );
  }
}
