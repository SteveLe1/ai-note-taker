import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class ContactShimmerItem extends StatelessWidget {
  const ContactShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.grey5.withOpacity(0.3),
          highlightColor: AppColors.grey5.withOpacity(0.1),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(right: 10.w),
                          alignment: Alignment.center,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 16.0.h,
                                    width: 36.w,
                                    decoration:
                                        BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Container(
                                    width: 92.w,
                                    height: 16.h,
                                    decoration:
                                        BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration:
                                        BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                  ),
                                  Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration:
                                        BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                  ),
                                  Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration:
                                        BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                  ),
                                  Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration:
                                        BoxDecoration(color: AppColors.white3, borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                  ),
                                ],
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
              width: 36.w,
              height: 36.h,
              child: CircularProgressIndicator(
                color: AppColors.mint1,
                strokeWidth: 4.w,
              )),
        )
      ],
    );
  }
}
