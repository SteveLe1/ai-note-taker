// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoReponse _$UserInfoReponseFromJson(Map<String, dynamic> json) =>
    UserInfoReponse(
      UserInfoModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoReponseToJson(UserInfoReponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      avatarUrl: json['avatarUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      statusVerifyPhone: json['statusVerifyPhone'] as String,
      receiveNotification: json['receiveNotification'] as bool,
      deviceId: json['deviceId'] as String,
      status: json['status'] as String,
      role: json['role'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'receiveNotification': instance.receiveNotification,
      'phoneNumber': instance.phoneNumber,
      'statusVerifyPhone': instance.statusVerifyPhone,
      'deviceId': instance.deviceId,
      'status': instance.status,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
