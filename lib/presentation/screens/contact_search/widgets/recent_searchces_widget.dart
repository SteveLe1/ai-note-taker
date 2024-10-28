import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/common/widgets/zp_text_button.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class RecentSearchesWidget extends StatelessWidget {
  const RecentSearchesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white3,
      padding: EdgeInsets.fromLTRB(10.w, 12.h, 10.w, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: ZPText(keyText: LocaleKeys.contact_list_recent_searches, style: TextStyles.w700Size17Black8,)),
              ZPTextButton(onPressed: () {
                debugPrint("Delete All");
              }, text: LocaleKeys.contact_list_delete_all, textStyle: TextStyles.w500Size14Grey1,),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.0.h),
                      child: Row(
                        children: [
                          ZPIcon(Ics.icSearch, width: 26.w, height: 26.h, color: AppColors.black8,),
                          SizedBox(width: 8.w,),
                          Expanded(child: ZPText(keyText: "골프", style: TextStyles.w400Size15Black8,)),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
