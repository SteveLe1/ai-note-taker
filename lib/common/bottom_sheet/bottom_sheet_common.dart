import 'package:flutter/material.dart';

abstract class BottomSheetCommon {
  Widget create(BuildContext context);

  Future<void> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: create,
    );
  }

  void hideBottomSheet(BuildContext context) {
    Navigator.of(context).pop();
  }
}
