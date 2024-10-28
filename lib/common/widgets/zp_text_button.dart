import 'package:flutter/material.dart';

import 'zp_text.dart';

class ZPTextButton extends StatelessWidget {
  const ZPTextButton(
      {required this.text,
        this.textStyle,
        this.onPressed,
        Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: ZPText(
        keyText: text,
        style: textStyle,
      ),
    );
  }
}