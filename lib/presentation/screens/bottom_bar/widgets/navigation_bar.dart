import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

import 'navigation_bar_item.dart';

// ignore: must_be_immutable
class TitledBottomNavigationBar extends StatefulWidget {
  final Curve curve;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? inactiveStripColor;
  final Color? indicatorColor;
  final bool enableShadow;
  int currentIndex;

  /// Called when a item is tapped.
  ///
  /// This provide the selected item's index.
  final ValueChanged<int> onTap;

  /// The items of this navigation bar.
  ///
  /// This should contain at least two items and five at most.
  final List<TitledNavigationBarItem> items;

  /// The selected item is indicator height.
  ///
  /// Defaults to [DEFAULT_INDICATOR_HEIGHT].
  final double indicatorHeight;

  /// Change the navigation bar's size.
  ///
  /// Defaults to [DEFAULT_BAR_HEIGHT].
  final double height;

  TitledBottomNavigationBar({
    Key? key,
    this.curve = Curves.linear,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor,
    this.inactiveStripColor,
    this.indicatorColor,
    this.enableShadow = false,
    this.currentIndex = 0,
    this.height = 60,
    this.indicatorHeight = 2,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  State createState() => _TitledBottomNavigationBarState();
}

class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar> {

  Curve get curve => widget.curve;

  List<TitledNavigationBarItem> get items => widget.items;

  double width = 0;
  Color? activeColor;
  Color? inactiveColor;
  Duration duration = const Duration(milliseconds: 270);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-0.9, 0.9, index / (items.length - 1))!;
    } else {
      return lerpDouble(0.9, -0.9, index / (items.length - 1))!;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? AppColors.black1;
    inactiveColor = widget.inactiveColor ?? AppColors.grey1;

    return Container(
      height: widget.height + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: widget.inactiveStripColor ?? AppColors.white1,
        border: const Border(
          top: BorderSide(
            color: AppColors.grey4,
            width: 0.5,
          ),
        ),
        boxShadow: widget.enableShadow
            ? [
          const BoxShadow(color: Color(0xFFE9EBED), blurRadius: 0.0, offset: Offset(0.0, -1.0)),
        ]
            : null,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: widget.indicatorHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(item, index == widget.currentIndex, index),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment: Alignment(_getIndicatorPosition(widget.currentIndex), 0),
              curve: curve,
              duration: duration,
              child: Container(
                color: AppColors.black1,
                width: (width / items.length) * 0.65,
                height: widget.indicatorHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _buildIconActive(TitledNavigationBarItem item) {
    return IconTheme(
      data: IconThemeData(
        color: activeColor,
      ),
      child: item.iconActive,
    );
  }

  Widget _buildIconInactive(TitledNavigationBarItem item) {
    return IconTheme(
      data: IconThemeData(
        color: activeColor,
      ),
      child: item.iconInactive,
    );
  }

  Widget _buildIconReport(TitledNavigationBarItem item, bool isSelected) {
    return Container(
      width: 44.w,
      height: 44.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: AppColors.black1,
        shape: BoxShape.circle
      ),
      child: ZPIcon(isSelected ? Ics.icReportFill : Ics.icReportLine, color: AppColors.white1,),
    );
  }

  Widget _buildItemWidget(TitledNavigationBarItem item, bool isSelected, int index) {
    return Container(
      color: item.backgroundColor,
      height: widget.height,
      width: width / items.length,
      child:
      Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: isSelected ? 0.0 : 1.0,
            duration: duration,
            curve: curve,
            child: index == 3 ? _buildIconReport(item, isSelected) : _buildIconInactive(item),
          ),
          AnimatedOpacity(
            opacity: !isSelected ? 0.0 : 1.0,
            duration: duration,
            curve: curve,
            child: index == 3 ? _buildIconReport(item, isSelected) : _buildIconActive(item),
          ),
        ],
      ),
    );
  }
}