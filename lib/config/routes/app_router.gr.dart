// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppPermissionSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppPermissionSettingsScreen(),
      );
    },
    BottomNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavigationScreen(),
      );
    },
    ChangeAccountMailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeAccountMailScreen(),
      );
    },
    ChangePasswordRouteStep1.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreenStep1(),
      );
    },
    ChangePasswordRouteStep2.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreenStep2(),
      );
    },
    ContactListNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactListNavigationScreen(),
      );
    },
    ContactListRoute.name: (routeData) {
      final args = routeData.argsAs<ContactListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactListScreen(
          key: args.key,
          bottomNavigationContext: args.bottomNavigationContext,
        ),
      );
    },
    ContactSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ContactSearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactSearchScreen(
          key: args.key,
          bottomNavigationContext: args.bottomNavigationContext,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeleteAccountScreen(),
      );
    },
    EditAllTagRoute.name: (routeData) {
      final args = routeData.argsAs<EditAllTagRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditAllTagScreen(
          key: args.key,
          bottomNavigationContext: args.bottomNavigationContext,
        ),
      );
    },
    EventNoticeDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventNoticeDetailScreen(),
      );
    },
    EventNoticeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventNoticeScreen(),
      );
    },
    FindPasswordSendEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindPasswordSendEmailScreen(),
      );
    },
    FindPasswordSetNewPwRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindPasswordSetNewPwScreen(),
      );
    },
    FindPasswordVerifyEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindPasswordVerifyEmailScreen(),
      );
    },
    FriendDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FriendDetailScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          bottomNavigationContext: args.bottomNavigationContext,
        ),
      );
    },
    MyNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyNoteScreen(),
      );
    },
    NotificationCenterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationCenterScreen(),
      );
    },
    NotificationSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationSettingsScreen(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreen(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PhoneVerificationScreen(),
      );
    },
    PremiumPricingPlanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PremiumPricingPlanScreen(),
      );
    },
    ReportDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportDetailScreen(),
      );
    },
    ReportNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportNavigationScreen(),
      );
    },
    ReportRevealRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportRevealScreen(),
      );
    },
    ReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportScreen(),
      );
    },
    SetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetPasswordScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TagNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TagNavigationScreen(),
      );
    },
    TagRoute.name: (routeData) {
      final args = routeData.argsAs<TagRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TagScreen(
          key: args.key,
          bottomNavigationContext: args.bottomNavigationContext,
        ),
      );
    },
    VerifiedAndPaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifiedAndPaymentScreen(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyEmailScreen(),
      );
    },
  };
}

/// generated route for
/// [AppPermissionSettingsScreen]
class AppPermissionSettingsRoute extends PageRouteInfo<void> {
  const AppPermissionSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AppPermissionSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppPermissionSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavigationScreen]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeAccountMailScreen]
class ChangeAccountMailRoute extends PageRouteInfo<void> {
  const ChangeAccountMailRoute({List<PageRouteInfo>? children})
      : super(
          ChangeAccountMailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeAccountMailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreenStep1]
class ChangePasswordRouteStep1 extends PageRouteInfo<void> {
  const ChangePasswordRouteStep1({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRouteStep1.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRouteStep1';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreenStep2]
class ChangePasswordRouteStep2 extends PageRouteInfo<void> {
  const ChangePasswordRouteStep2({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRouteStep2.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRouteStep2';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactListNavigationScreen]
class ContactListNavigationRoute extends PageRouteInfo<void> {
  const ContactListNavigationRoute({List<PageRouteInfo>? children})
      : super(
          ContactListNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactListNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactListScreen]
class ContactListRoute extends PageRouteInfo<ContactListRouteArgs> {
  ContactListRoute({
    Key? key,
    required BuildContext bottomNavigationContext,
    List<PageRouteInfo>? children,
  }) : super(
          ContactListRoute.name,
          args: ContactListRouteArgs(
            key: key,
            bottomNavigationContext: bottomNavigationContext,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactListRoute';

  static const PageInfo<ContactListRouteArgs> page =
      PageInfo<ContactListRouteArgs>(name);
}

class ContactListRouteArgs {
  const ContactListRouteArgs({
    this.key,
    required this.bottomNavigationContext,
  });

  final Key? key;

  final BuildContext bottomNavigationContext;

  @override
  String toString() {
    return 'ContactListRouteArgs{key: $key, bottomNavigationContext: $bottomNavigationContext}';
  }
}

/// generated route for
/// [ContactSearchScreen]
class ContactSearchRoute extends PageRouteInfo<ContactSearchRouteArgs> {
  ContactSearchRoute({
    Key? key,
    required BuildContext bottomNavigationContext,
    List<PageRouteInfo>? children,
  }) : super(
          ContactSearchRoute.name,
          args: ContactSearchRouteArgs(
            key: key,
            bottomNavigationContext: bottomNavigationContext,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactSearchRoute';

  static const PageInfo<ContactSearchRouteArgs> page =
      PageInfo<ContactSearchRouteArgs>(name);
}

class ContactSearchRouteArgs {
  const ContactSearchRouteArgs({
    this.key,
    required this.bottomNavigationContext,
  });

  final Key? key;

  final BuildContext bottomNavigationContext;

  @override
  String toString() {
    return 'ContactSearchRouteArgs{key: $key, bottomNavigationContext: $bottomNavigationContext}';
  }
}

/// generated route for
/// [DeleteAccountScreen]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          DeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditAllTagScreen]
class EditAllTagRoute extends PageRouteInfo<EditAllTagRouteArgs> {
  EditAllTagRoute({
    Key? key,
    required BuildContext bottomNavigationContext,
    List<PageRouteInfo>? children,
  }) : super(
          EditAllTagRoute.name,
          args: EditAllTagRouteArgs(
            key: key,
            bottomNavigationContext: bottomNavigationContext,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAllTagRoute';

  static const PageInfo<EditAllTagRouteArgs> page =
      PageInfo<EditAllTagRouteArgs>(name);
}

class EditAllTagRouteArgs {
  const EditAllTagRouteArgs({
    this.key,
    required this.bottomNavigationContext,
  });

  final Key? key;

  final BuildContext bottomNavigationContext;

  @override
  String toString() {
    return 'EditAllTagRouteArgs{key: $key, bottomNavigationContext: $bottomNavigationContext}';
  }
}

/// generated route for
/// [EventNoticeDetailScreen]
class EventNoticeDetailRoute extends PageRouteInfo<void> {
  const EventNoticeDetailRoute({List<PageRouteInfo>? children})
      : super(
          EventNoticeDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventNoticeDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventNoticeScreen]
class EventNoticeRoute extends PageRouteInfo<void> {
  const EventNoticeRoute({List<PageRouteInfo>? children})
      : super(
          EventNoticeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventNoticeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindPasswordSendEmailScreen]
class FindPasswordSendEmailRoute extends PageRouteInfo<void> {
  const FindPasswordSendEmailRoute({List<PageRouteInfo>? children})
      : super(
          FindPasswordSendEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindPasswordSendEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindPasswordSetNewPwScreen]
class FindPasswordSetNewPwRoute extends PageRouteInfo<void> {
  const FindPasswordSetNewPwRoute({List<PageRouteInfo>? children})
      : super(
          FindPasswordSetNewPwRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindPasswordSetNewPwRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindPasswordVerifyEmailScreen]
class FindPasswordVerifyEmailRoute extends PageRouteInfo<void> {
  const FindPasswordVerifyEmailRoute({List<PageRouteInfo>? children})
      : super(
          FindPasswordVerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindPasswordVerifyEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FriendDetailScreen]
class FriendDetailRoute extends PageRouteInfo<void> {
  const FriendDetailRoute({List<PageRouteInfo>? children})
      : super(
          FriendDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeNavigationScreen]
class HomeNavigationRoute extends PageRouteInfo<void> {
  const HomeNavigationRoute({List<PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    required BuildContext bottomNavigationContext,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            bottomNavigationContext: bottomNavigationContext,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.bottomNavigationContext,
  });

  final Key? key;

  final BuildContext bottomNavigationContext;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, bottomNavigationContext: $bottomNavigationContext}';
  }
}

/// generated route for
/// [MyNoteScreen]
class MyNoteRoute extends PageRouteInfo<void> {
  const MyNoteRoute({List<PageRouteInfo>? children})
      : super(
          MyNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationCenterScreen]
class NotificationCenterRoute extends PageRouteInfo<void> {
  const NotificationCenterRoute({List<PageRouteInfo>? children})
      : super(
          NotificationCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationCenterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationSettingsScreen]
class NotificationSettingsRoute extends PageRouteInfo<void> {
  const NotificationSettingsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneVerificationScreen]
class PhoneVerificationRoute extends PageRouteInfo<void> {
  const PhoneVerificationRoute({List<PageRouteInfo>? children})
      : super(
          PhoneVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PremiumPricingPlanScreen]
class PremiumPricingPlanRoute extends PageRouteInfo<void> {
  const PremiumPricingPlanRoute({List<PageRouteInfo>? children})
      : super(
          PremiumPricingPlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'PremiumPricingPlanRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportDetailScreen]
class ReportDetailRoute extends PageRouteInfo<void> {
  const ReportDetailRoute({List<PageRouteInfo>? children})
      : super(
          ReportDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportNavigationScreen]
class ReportNavigationRoute extends PageRouteInfo<void> {
  const ReportNavigationRoute({List<PageRouteInfo>? children})
      : super(
          ReportNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportRevealScreen]
class ReportRevealRoute extends PageRouteInfo<void> {
  const ReportRevealRoute({List<PageRouteInfo>? children})
      : super(
          ReportRevealRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRevealRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportScreen]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute({List<PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetPasswordScreen]
class SetPasswordRoute extends PageRouteInfo<void> {
  const SetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          SetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TagNavigationScreen]
class TagNavigationRoute extends PageRouteInfo<void> {
  const TagNavigationRoute({List<PageRouteInfo>? children})
      : super(
          TagNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TagScreen]
class TagRoute extends PageRouteInfo<TagRouteArgs> {
  TagRoute({
    Key? key,
    required BuildContext bottomNavigationContext,
    List<PageRouteInfo>? children,
  }) : super(
          TagRoute.name,
          args: TagRouteArgs(
            key: key,
            bottomNavigationContext: bottomNavigationContext,
          ),
          initialChildren: children,
        );

  static const String name = 'TagRoute';

  static const PageInfo<TagRouteArgs> page = PageInfo<TagRouteArgs>(name);
}

class TagRouteArgs {
  const TagRouteArgs({
    this.key,
    required this.bottomNavigationContext,
  });

  final Key? key;

  final BuildContext bottomNavigationContext;

  @override
  String toString() {
    return 'TagRouteArgs{key: $key, bottomNavigationContext: $bottomNavigationContext}';
  }
}

/// generated route for
/// [VerifiedAndPaymentScreen]
class VerifiedAndPaymentRoute extends PageRouteInfo<void> {
  const VerifiedAndPaymentRoute({List<PageRouteInfo>? children})
      : super(
          VerifiedAndPaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifiedAndPaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailScreen]
class VerifyEmailRoute extends PageRouteInfo<void> {
  const VerifyEmailRoute({List<PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
