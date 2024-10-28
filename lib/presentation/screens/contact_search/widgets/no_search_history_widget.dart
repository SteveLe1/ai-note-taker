import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class NoSearchHistoryWidget extends StatelessWidget {
  const NoSearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white3,
      padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZPText(keyText: LocaleKeys.contact_list_recent_searches, style: TextStyles.w700Size17Black8,),
          Expanded(
              child: Center(
                child: ZPText(keyText: LocaleKeys.contact_list_there_is_no_search_history, style: TextStyles.w500Size14Grey1,),
              ))
        ],
      ),
    );
  }
}
