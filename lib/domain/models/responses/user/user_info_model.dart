import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoReponse {
  final UserInfoModel data;

  factory UserInfoReponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoReponseFromJson(json);

  const UserInfoReponse(this.data);

  Map<String, dynamic> toJson() => _$UserInfoReponseToJson(this);
}

@JsonSerializable()
class UserInfoModel {
  final String id;
  final String email;
  final String fullName;
  final String avatarUrl;
  final bool receiveNotification;
  final String phoneNumber;
  final String statusVerifyPhone;
  final String deviceId;
  final String status;
  final String role;
  final String createdAt;
  final String updatedAt;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  const UserInfoModel(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.avatarUrl,
      required this.phoneNumber,
      required this.statusVerifyPhone,
      required this.receiveNotification,
      required this.deviceId,
      required this.status,
      required this.role,
      required this.createdAt,
      required this.updatedAt});

  factory UserInfoModel.defaultUser() {
    return const UserInfoModel(
        id: '',
        email: '',
        fullName: '',
        avatarUrl: '',
        phoneNumber: '',
        statusVerifyPhone: '',
        receiveNotification: true,
        deviceId: '',
        status: '',
        role: '',
        createdAt: '',
        updatedAt: '');
  }

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
