import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/tag/widgets/tag_container_item_widget.dart';
import 'package:coconut_note/utils/enum/enum.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class AllTags extends StatefulWidget {
  const AllTags({super.key});

  @override
  State<AllTags> createState() => _AllTagsState();
}

class _AllTagsState extends State<AllTags> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.0.w),
          child: ZPText(
            keyText: LocaleKeys.tag_all_tag,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.h),
          child: Column(
            children: TagColor.values
                .map((e) => Row(
                      children: [
                        Expanded(flex: 1, child: TagContainerItemWidget(tagColor: e))
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
