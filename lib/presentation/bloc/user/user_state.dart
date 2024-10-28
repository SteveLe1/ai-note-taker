import 'package:equatable/equatable.dart';
import 'package:zippy_flutter/domain/models/responses/user/user_info_model.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';

class UserState extends Equatable {
  final StateStatus status;
  final UserInfoModel userInfoModel;
  final bool loggedIn;
  final bool enableMyCheckInNotifications;
  final String errorText;
  final String aboutUs;
  final String privacyPolicy;
  final int totalBugsSubmit;
  final int totalAdminGroup;

  const UserState(
      {required this.status,
      required this.userInfoModel,
      required this.loggedIn,
      required this.errorText,
      required this.aboutUs,
      required this.privacyPolicy,
      required this.enableMyCheckInNotifications,
      this.totalBugsSubmit = 0, this.totalAdminGroup = 0});

  UserState copyWith(
      {StateStatus? status,
      UserInfoModel? userInfoModel,
      bool? loggedIn,
      String? errorText,
      String? aboutUs,
      String? privacyPolicy,
      bool? enableMyCheckInNotifications,
      int? totalBugsSubmit, int? totalAdminGroup}) {
    return UserState(
        status: status ?? this.status,
        userInfoModel: userInfoModel ?? this.userInfoModel,
        loggedIn: loggedIn ?? this.loggedIn,
        errorText: errorText ?? this.errorText,
        aboutUs: aboutUs ?? this.aboutUs,
        privacyPolicy: privacyPolicy ?? this.privacyPolicy,
        enableMyCheckInNotifications:
            enableMyCheckInNotifications ?? this.enableMyCheckInNotifications,
        totalBugsSubmit: totalBugsSubmit ?? this.totalBugsSubmit,
        totalAdminGroup: totalAdminGroup ?? this.totalAdminGroup);
  }

  @override
  List<Object> get props => [
        status,
        userInfoModel,
        loggedIn,
        errorText,
        aboutUs,
        privacyPolicy,
        enableMyCheckInNotifications,
        totalBugsSubmit, totalAdminGroup
      ];
}
