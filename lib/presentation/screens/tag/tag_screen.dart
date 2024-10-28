import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_floating_action_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_search_textfield.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/add_group_bottom_sheet.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/add_tag_bottom_sheet.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/all_tags_widget.dart';
import 'package:zippy_flutter/presentation/screens/tag/widgets/recent_search_tags_widget.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

import 'widgets/tag_search_widget.dart';

@RoutePage()
class TagScreen extends StatefulWidget {
  const TagScreen({super.key, required this.bottomNavigationContext});

  final BuildContext bottomNavigationContext;

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  bool isCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
        context: context,
        disableLeading: true,
        titleWidget: Padding(
          padding: EdgeInsets.only(left: 25.0.w),
          child: ZPText(keyText: LocaleKeys.tag_header_title, style: TextStyles.w700Size25Black3,),
        ),
      ),
      floatingActionButton: ZPFloatingActionButton(
        onPressAddTag: () => AddTagBottomSheet().showBottomSheet(widget.bottomNavigationContext),
        onPressAddGroup: () => AddGroupBottomSheet(onChanged: (value) {
          debugPrint("value $value");
        }).showBottomSheet(widget.bottomNavigationContext),
        onPressEditAll: () => appRouter.push(EditAllTagRoute(bottomNavigationContext: widget.bottomNavigationContext)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.white1,
              padding: EdgeInsets.all(15.0.h),
              child: const TagSearchWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.0.h, right: 15.0.h, bottom: 20.0.h),
              child: Divider(
                height: 1.0.h,
                color: AppColors.white4,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const RecentSearchTags(), const AllTags(), SizedBox(height: 96.h)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
