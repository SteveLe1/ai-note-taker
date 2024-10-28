import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/group_tag_widget.dart';

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
          padding: EdgeInsets.only(left: 25.0.w, bottom: 20.h),
          child: ZPText(
            keyText: LocaleKeys.tag_all_tag,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.h),
          child: Column(
            children: [
              for (int item in [1, 2, 3])
                const Row(
                  children: [
                    Expanded(flex: 1, child: GroupTagWidget())
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
