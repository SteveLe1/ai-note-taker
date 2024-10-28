import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_label_tag.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class IMTagCard extends StatelessWidget {
  const IMTagCard({super.key, this.tagColor, this.tags, this.cardColor});

  final Color? tagColor;
  final Color? cardColor;
  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.red1,
                border: Border.all(color: AppColors.white4),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 15.w),
              decoration: const BoxDecoration(
                color: AppColors.white1,
              ),
              child: (tags == null || tags!.isEmpty)
                  ? SizedBox(
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ZPIcon(
                            Ics.icPlus,
                            color: AppColors.black1,
                            width: 10.w,
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          ZPText(keyText: 'add_tag'.tr())
                        ],
                      ),
                    )
                  : Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: [
                        ...tags!
                            .map((e) => ZPLabelTag(
                                  color: cardColor ?? AppColors.black8,
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      color: tagColor ?? AppColors.black8),
                                  textLabel: e,
                                ))
                            .toList(),
                      ],
                    ),
            ))
      ],
    );
  }
}
