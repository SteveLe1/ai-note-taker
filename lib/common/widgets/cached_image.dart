import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {Key? key, required this.image, this.height, this.width, this.boxFit})
      : super(key: key);

  final String? image;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          image ?? "https://cdn-icons-png.flaticon.com/512/4086/4086679.png",
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 40.0,
          height: 40.0,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(Icons.error, color: Colors.red));
      },
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.fitWidth),
        ),
      ),
      height: height,
      fit: boxFit ?? BoxFit.contain,
      width: width,
    );
  }
}
