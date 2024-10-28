import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zippy_flutter/presentation/screens/bottom_bar/bottom_navigation_screen.dart';
import 'package:zippy_flutter/presentation/screens/contact_list/contact_list_natigation_screen.dart';
import 'package:zippy_flutter/presentation/screens/contact_list/contact_list_screen.dart';
import 'package:zippy_flutter/presentation/screens/contact_search/contact_search_screen.dart';
import 'package:zippy_flutter/presentation/screens/home/home_natigation_screen.dart';
import 'package:zippy_flutter/presentation/screens/home/home_screen.dart';
import 'package:zippy_flutter/presentation/screens/find_password/find_password_send_email.dart';
import 'package:zippy_flutter/presentation/screens/find_password/find_password_set_new_pw_screen.dart';
import 'package:zippy_flutter/presentation/screens/find_password/find_password_verify_email_screen.dart';
import 'package:zippy_flutter/presentation/screens/friend_detail/friend_detail_screen.dart';
import 'package:zippy_flutter/presentation/screens/on_boarding/app_permission_settings_screen.dart';
import 'package:zippy_flutter/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/change_account_mail_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/change_password_screen_step1.dart';
import 'package:zippy_flutter/presentation/screens/setting/change_password_screen_step2.dart';
import 'package:zippy_flutter/presentation/screens/setting/delete-account_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/event_notice_detail_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/event_notice_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/notification_settings_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/premium_pricing_plan_screen.dart';
import 'package:zippy_flutter/presentation/screens/setting/setting_screen.dart';
import 'package:zippy_flutter/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:zippy_flutter/presentation/screens/sign_up/sign_up_step1_screen.dart';
import 'package:zippy_flutter/presentation/screens/sign_up/sign_up_step2_screen.dart';
import 'package:zippy_flutter/presentation/screens/sign_up/verify_email_screen.dart';
import 'package:zippy_flutter/presentation/screens/splash/splash_screen.dart';
import 'package:zippy_flutter/presentation/screens/notification/notification_center_screen.dart';
import 'package:zippy_flutter/presentation/screens/tag/edit_all_tag_screen.dart';
import 'package:zippy_flutter/presentation/screens/tag/tag_natigation_screen.dart';
import 'package:zippy_flutter/presentation/screens/tag/tag_screen.dart';
import 'package:zippy_flutter/presentation/screens/view_report/phone_verification_screen.dart';
import 'package:zippy_flutter/presentation/screens/view_report/report_detail_screen.dart';
import 'package:zippy_flutter/presentation/screens/view_report/report_navigation_screen.dart';
import 'package:zippy_flutter/presentation/screens/view_report/report_reveal_screen.dart';
import 'package:zippy_flutter/presentation/screens/view_report/report_screen.dart';
import 'package:zippy_flutter/presentation/screens/view_report/verified_and_payment_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: BottomNavigationRoute.page, children: [
      AutoRoute(
        page: HomeNavigationRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: ContactSearchRoute.page),
        ],
      ),
      AutoRoute(
        page: ContactListNavigationRoute.page,
        children: [
          AutoRoute(page: ContactListRoute.page, initial: true),
          AutoRoute(page: ContactSearchRoute.page),
        ],
      ),
      AutoRoute(
        page: TagNavigationRoute.page,
        children: [
          AutoRoute(page: TagRoute.page, initial: true),
          AutoRoute(page: EditAllTagRoute.page),
        ],
      ),
      AutoRoute(
        page: ReportNavigationRoute.page,
        children: [
          AutoRoute(path: 'report', page: ReportRoute.page, initial: true),
          AutoRoute(page: PhoneVerificationRoute.page),
          AutoRoute(page: VerifiedAndPaymentRoute.page),
          AutoRoute(page: ReportRevealRoute.page),
          AutoRoute(page: ReportDetailRoute.page),
        ],
      ),
    ]),
    AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/sign_in', page: SignInRoute.page),
    AutoRoute(
      path: '/sign_up',
      page: SignUpRoute.page,
    ),
    AutoRoute(
      path: '/verify_email',
      page: VerifyEmailRoute.page,
    ),
    AutoRoute(
      path: '/set_password',
      page: SetPasswordRoute.page,
    ),
    AutoRoute(
      path: '/find_password_send_email',
      page: FindPasswordSendEmailRoute.page,
    ),
    AutoRoute(
      path: '/find_password_set_pw',
      page: FindPasswordSetNewPwRoute.page,
    ),
    AutoRoute(
      path: '/find_password_verify_email',
      page: FindPasswordVerifyEmailRoute.page,
    ),
    AutoRoute(path: '/app_permission_settings', page: AppPermissionSettingsRoute.page),
    AutoRoute(path: '/on_boarding', page: OnBoardingRoute.page),
    AutoRoute(path: '/notification_center', page: NotificationCenterRoute.page),
    AutoRoute(path: '/friend_detail', page: FriendDetailRoute.page),
    AutoRoute(path:"/setting",page: SettingRoute.page),
    AutoRoute(path: '/change_account_mail',page: ChangeAccountMailRoute.page),
    AutoRoute(path: '/change_password_step1',page: ChangePasswordRouteStep1.page),
    AutoRoute(path: '/change_password_step2',page: ChangePasswordRouteStep2.page),
    AutoRoute(path: '/event_notice',page: EventNoticeRoute.page),
    AutoRoute(path: '/event_notice_detail',page: EventNoticeDetailRoute.page),
    AutoRoute(path: '/delete_account',page: DeleteAccountRoute.page),
    AutoRoute(path: '/notification_settings',page: NotificationSettingsRoute.page),
    AutoRoute(path: '/premium_pricing_plan',page: PremiumPricingPlanRoute.page),
  ];
}

final appRouter = AppRouter();