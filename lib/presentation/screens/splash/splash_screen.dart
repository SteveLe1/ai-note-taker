import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/bloc/splash/splash_cubit.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void handleTimeout() {
    appRouter.push(const BottomNavigationRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is RedirectToHomeScreenState && state.token != null) {
            Timer(const Duration(seconds: 3), handleTimeout);
          }
        },
        child: BackgroundWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 45.h),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ZPIcon(
                        Images.logo,
                        width: 314.w,
                        height: 143.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ZPText(
                        keyText: LocaleKeys.splash_description,
                        style: TextStyles.w500Size16Grey2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                BlocBuilder<SplashCubit, SplashState>(
                  builder: (context, state) {
                    String? token;
                    if (state is RedirectToHomeScreenState) {
                      token = state.token;
                    }
                    debugPrint("token= $token");
                    if (token != null) {
                      return const SizedBox();
                    } else {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: ZPButton(
                          text: LocaleKeys.btn_get_start,
                          width: MediaQuery.of(context).size.width,
                          height: 58.h,
                          radius: 20,
                          onPressed: () {
                            appRouter.replace(const SignInRoute());
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
