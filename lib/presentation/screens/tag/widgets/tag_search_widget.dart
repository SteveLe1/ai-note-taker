import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_search_textfield.dart';
import 'package:zippy_flutter/domain/entities/tag.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';

import 'tag_item_widget.dart';

class TagSearchWidget extends StatefulWidget {
  const TagSearchWidget({super.key});

  @override
  State<TagSearchWidget> createState() => _TagSearchWidgetState();
}

class _TagSearchWidgetState extends State<TagSearchWidget> {
  TextEditingController controller = TextEditingController();
  List<Tag> listTags = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ZPSearchTextField(
          controller: controller,
          hintText: listTags.isEmpty ? LocaleKeys.tag_hint_search : "",
          onChanged: (String text) {
            if (text.substring(text.length - 1) == " ") {
              setState(() {
                listTags.add(Tag(name: text, tagColor: TagColor.zippy2));
                controller.text = "";
              });
            }
          },
          prefixIcon: listTags.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 10.h, left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        children: listTags
                            .map((e) => Container(
                                margin: EdgeInsets.only(
                                    right: 10.0.w, bottom: 10.0.h),
                                child: TagItemWidget(
                                  tagText: e.name,
                                  tagColor: TagColor.zippy3,
                                  isShowBorder: true,
                                  onClose: () {
                                    setState(() {
                                      listTags.removeAt(listTags.indexOf(e));
                                    });
                                  },
                                )))
                            .toList(),
                      ),
                    ],
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
