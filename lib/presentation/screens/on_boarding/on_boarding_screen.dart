import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingData> list = [
    OnBoardingData(Images.onboarding1, LocaleKeys.onboarding_title_1, LocaleKeys.onboarding_description_1),
    OnBoardingData(Images.onboarding2, LocaleKeys.onboarding_title_2, LocaleKeys.onboarding_description_2),
    OnBoardingData(Images.onboarding3, LocaleKeys.onboarding_title_3, LocaleKeys.onboarding_description_3),
    OnBoardingData(Images.onboarding4, LocaleKeys.onboarding_title_4, LocaleKeys.onboarding_description_4),
    OnBoardingData(Images.onboarding5, LocaleKeys.onboarding_title_5, LocaleKeys.onboarding_description_5),
  ];
  int currentIndex = 0;
  late final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white3,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: list.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 70.h),
                          child: Center(
                              child: ZPText(
                            keyText: list[i].title,
                            style: TextStyles.w700Size22Black3,
                            textAlign: TextAlign.center,
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: i != 4 ? 46.0.h : 75.h, bottom: 50.h),
                          child: ZPIcon(
                            list[i].image,
                            width: 319.w,
                            height: 284.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.h),
                          child: ZPText(
                            keyText: list[i].description,
                            style: TextStyles.w500Size17Black5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  list.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0.h, left: 25.w, right: 25.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  currentIndex + 1 != list.length
                      ? Container(
                          width: 98.h,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.jumpToPage(4);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              disabledBackgroundColor: AppColors.white4,
                              backgroundColor: AppColors.white4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: ZPText(keyText: LocaleKeys.onboarding_skip, style: TextStyles.w600Size16Black8),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  currentIndex + 1 != list.length
                      ? SizedBox(
                          width: 15.w,
                        )
                      : const SizedBox(),
                  Expanded(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 58.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex + 1 == list.length) {
                          appRouter.replace(const BottomNavigationRoute());
                        } else {
                          _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        disabledBackgroundColor: AppColors.mint2,
                        backgroundColor: AppColors.mint2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: ZPText(
                            keyText: currentIndex + 1 != list.length
                                ? LocaleKeys.onboarding_next
                                : LocaleKeys.onboarding_start,
                            style: TextStyles.w600Size16Black3),
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6.h,
      width: currentIndex == index ? 30.w : 6.w,
      margin: EdgeInsets.only(right: 7.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? AppColors.black8 : AppColors.grey5,
      ),
    );
  }
}

class OnBoardingData {
  String image;
  String title;
  String description;

  OnBoardingData(this.image, this.title, this.description);
}
