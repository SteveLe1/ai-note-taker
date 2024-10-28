import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/toast/toast_common.dart';
import 'package:zippy_flutter/common/widgets/background_widget.dart';
import 'package:zippy_flutter/common/widgets/zp_button.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/common/widgets/zp_text_button.dart';
import 'package:zippy_flutter/common/widgets/zp_textfield.dart';
import 'package:zippy_flutter/config/routes/app_router.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/presentation/bloc/log_in/log_in_bloc.dart';
import 'package:zippy_flutter/presentation/bloc/log_in/log_in_state.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return BlocProvider(
            create: (context) => LogInBloc(),
            child: BlocConsumer<LogInBloc, LoginState>(
              listener: (context, state) {
              if (state.status == StateStatus.success) {
                  appRouter.push(const BottomNavigationRoute());
                }
              },
              builder: (context, state) {
                final loginBloc = BlocProvider.of<LogInBloc>(context);
                return Form(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 15.h, bottom: 60.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Spacer(),
                              ZPIcon(
                                Images.logo,
                                width: 220.w,
                                height: 100.h,
                              ),
                              ZPText(
                                keyText: LocaleKeys.splash_description,
                                style: TextStyles.w500Size16Grey2,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              ZPTextField(
                                hintText: LocaleKeys.email_address,
                                hintStyle: TextStyles.w500Size15Black7,
                                onChanged: (text) {
                                  loginBloc.add((ChangeEmailEvent(email: text)));
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              ZPTextField(
                                obscureText: true,
                                hintText: LocaleKeys.password,
                                hintStyle: TextStyles.w500Size15Black7,
                                onChanged: (text) {
                                  loginBloc.add(ChangePasswordEvent(password: text));
                                  // enableLoginButton();
                                },
                              ),
                              BlocBuilder<LogInBloc, LoginState>(
                                builder: (context, state) {
                                  if (state.error.isNotEmpty) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 10.h, left: 15.w),
                                      child: Row(
                                        children: [
                                          ZPText(
                                            keyText: LocaleKeys.error_message_please_check_email_format,
                                            style: TextStyles.w600Size13Red1,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              BlocBuilder<LogInBloc, LoginState>(
                                builder: (context, state) {
                                  bool isEnableLoginButton = state.isEnableLoginButton;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: ZPButton(
                                      disabled: !isEnableLoginButton,
                                      text: LocaleKeys.login,
                                      width: MediaQuery.of(context).size.width,
                                      onPressed: () {
                                        // loginBloc.add(LoginAppEvent());
                                        appRouter.push(const BottomNavigationRoute());
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ZPTextButton(
                                    text: LocaleKeys.signup,
                                    textStyle: TextStyles.w500Size15Mint1,
                                    onPressed: () {
                                      appRouter.push(const SignUpRoute());
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  ZPText(
                                    keyText: "|",
                                    style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey1),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  ZPTextButton(
                                    text: LocaleKeys.find_password,
                                    textStyle: TextStyles.w500Size15Grey1,
                                    onPressed: () async {
                                      appRouter.push(const FindPasswordSendEmailRoute());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
