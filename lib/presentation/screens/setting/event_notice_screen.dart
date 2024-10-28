import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_app_bar.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/setting/widgets/event_notice_item_widget.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class EventNoticeScreen extends StatefulWidget {
  const EventNoticeScreen({super.key});

  @override
  State<EventNoticeScreen> createState() => _EventNoticeScreenState();
}

class _EventNoticeScreenState extends State<EventNoticeScreen> {
  List<EventNoticeModel> list = EventNoticeModel.getList();
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      appBar: ZPAppBar(context: context, title: LocaleKeys.event_notice_title_app_bar, textStyle: TextStyles.w600Size17Black1,backgroundColor: AppColors.white1, centerTitle: true, isShowDivider: true,),
      child: SafeArea(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index){
              return EventNoticeItemWidget(time: list[index].time, title: list[index].title);
            }
        )
      ),
    );
  }
}
class EventNoticeModel{
  String id;
  String time;
  String title;

  EventNoticeModel(this.id, this.time, this.title);
  static List<EventNoticeModel> getList(){
    List<EventNoticeModel> list = [];
    list.add(EventNoticeModel("1", "2023.11.15", "공지 또는 이벤트의 제목 Text Text Text Text Text Text"));
    list.add(EventNoticeModel("1", "2023.11.13", "공지 또는 이벤트의 제목 Text Text Text Text Text Text"));
    list.add(EventNoticeModel("1", "2023.11.15", "Ditto - New Jeans"));
    list.add(EventNoticeModel("1", "2023.11.13", "공지 또는 이벤트의 제목 Text Text Text"));
    list.add(EventNoticeModel("1", "2023.11.13", "공지 또는 이벤트의 제목 Text Text Text"));

    return list;
  }
}
