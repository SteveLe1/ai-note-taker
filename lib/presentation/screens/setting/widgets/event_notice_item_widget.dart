import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class EventNoticeItemWidget extends StatelessWidget {
  String time;
  String title;
  EventNoticeItemWidget({super.key, required this.time, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        appRouter.push(const EventNoticeDetailRoute());
      },
      child: Container(
        padding: EdgeInsets.only(left: 20.w, top: 15.h, right: 20.w, bottom: 15.h),
        decoration: const BoxDecoration(
          color: AppColors.white1,
          border: Border(
            bottom: BorderSide(
              color: AppColors.white4,
              width: 1
            )
          )
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: time, style: TextStyles.w400Size11Black8,),
            SizedBox(height: 10.h,),
            SizedBox(
                width: 266.w,
                child: ZPText(keyText: title, style: TextStyles.w400Size15Black3,)
            ),
          ],
        ),
      ),
    );
  }
}
