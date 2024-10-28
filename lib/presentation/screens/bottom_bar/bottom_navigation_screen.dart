import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/presentation/screens/bottom_bar/widgets/navigation_bar.dart';
import 'package:coconut_note/presentation/screens/bottom_bar/widgets/navigation_bar_item.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

@RoutePage()
class BottomNavigationScreen extends StatefulWidget {

  const BottomNavigationScreen({super.key});

  @override
  State createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        HomeRoute(bottomNavigationContext: context),
        ContactListRoute(bottomNavigationContext: context),
        TagRoute(bottomNavigationContext: context),
        ReportRoute()
      ],
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);

        //you could use a global key
        return Scaffold(
            body: child,
            bottomNavigationBar: TitledBottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              items: [
                TitledNavigationBarItem(
                    iconActive: const ZPIcon(Ics.icHomeFill), iconInactive: const ZPIcon(Ics.icHomeLine, color: AppColors.grey4,)),
                TitledNavigationBarItem(iconActive: const ZPIcon(Ics.icList), iconInactive: const ZPIcon(Ics.icList)),
                TitledNavigationBarItem(
                    iconActive: const ZPIcon(Ics.icTagFill), iconInactive: const ZPIcon(Ics.icTagLine, color: AppColors.grey4)),
                TitledNavigationBarItem(
                    iconActive: const ZPIcon(Ics.icReportFill, color: AppColors.white1), iconInactive: const ZPIcon(Ics.icReportLine)),
              ],
            ));
      },
    );
  }
}
