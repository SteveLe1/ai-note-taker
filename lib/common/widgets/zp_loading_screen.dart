import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';

class ZPLoadingScreen extends StatelessWidget {
  const ZPLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black1.withOpacity(0.2),
      // backgroundColor: Colors.transparent,
      body: const LoadingIcon(),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50.w,
        height: 50.h,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.white1,
            ),
          ],
        ),
      ),
    );
  }
}
