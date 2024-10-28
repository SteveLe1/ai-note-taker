import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_app_bar.dart';
import 'package:zippy_flutter/common/widgets/zp_search_textfield.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/screens/contact_search/widgets/no_search_history_widget.dart';
import 'package:zippy_flutter/presentation/screens/contact_search/widgets/recent_search_list_widget.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class ContactSearchScreen extends StatefulWidget {
  const ContactSearchScreen({super.key, required this.bottomNavigationContext});

  final BuildContext bottomNavigationContext;

  @override
  State<ContactSearchScreen> createState() => _ContactSearchScreenState();
}

class _ContactSearchScreenState extends State<ContactSearchScreen> {
  bool isCheckSearchResult = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white1,
      appBar: ZPAppBar(
        context: context,
        leadingWidget: const AutoLeadingButton(),
        titleWidget: ZPText(
          keyText: LocaleKeys.contact_list_search,
          style: TextStyles.w700Size25Black3,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0.h),
              child: ZPSearchTextField(
                hintText: LocaleKeys.contact_list_hint_search,
                onChanged: (searchText){
                  if(searchText.isNotEmpty){
                    setState(() {
                      isCheckSearchResult = true;
                    });
                  }else {
                    setState(() {
                      isCheckSearchResult = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0.h),
              child: const Divider(
                color: AppColors.white4,
                height: 1,
              ),
            ),
            Expanded(
              child: isCheckSearchResult ? RecentSearchListWidget(bottomNavigationContext: widget.bottomNavigationContext,) : const NoSearchHistoryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
