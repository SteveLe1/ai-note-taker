import 'package:flutter/material.dart';
import 'package:zippy_flutter/common/widgets/zp_floating_action.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.scaffoldKey,
    this.color = AppColors.black2,
    this.floatingActionButton
  }) : super(key: key);

  final Widget? child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final Key? scaffoldKey;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: scaffoldKey,
          backgroundColor: color,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomNavigationBar: bottomNavigationBar,
          appBar: appBar,
          extendBody: extendBody,
          body: child,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: ZPExpandableFab.location,
        ),
      ],
    );
  }
}