import 'package:flutter/material.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class TitledNavigationBarItem {
  /// The icon of this item.
  ///
  /// If this is not a [Icon] widget, you must handle the color manually.
  ///
  final Widget iconActive;
  final Widget iconInactive;

  /// The background color of this item.
  ///
  /// Defaults to [Colors.white].
  final Color backgroundColor;

  TitledNavigationBarItem({
    required this.iconActive,
    required this.iconInactive,
    this.backgroundColor = AppColors.white1,
  });
}
