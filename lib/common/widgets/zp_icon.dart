import 'package:coconut_note/common/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ZPIcon extends StatelessWidget {
  const ZPIcon(this.icon,
      {Key? key, this.color, this.width, this.height, this.fit})
      : super(key: key);

  final String icon;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final tail = icon.split('.').last;
    if (icon.startsWith('http') || icon.startsWith('https')) {
      return CachedImage(
        image: icon,
        width: width,
        height: height,
      );
    }
    if (tail.contains('svg')) {
      return SvgPicture.asset(
        icon,
        color: color,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }
    return Image.asset(
      icon,
      color: color,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      errorBuilder: (context, e, trace) {
        return const Icon(Icons.error);
      },
    );
  }
}
