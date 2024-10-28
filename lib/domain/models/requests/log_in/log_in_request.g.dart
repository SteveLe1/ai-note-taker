// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInRequest _$LogInRequestFromJson(Map<String, dynamic> json) => LogInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      device: json['device'] as String,
      deviceType: (json['device_type'] as num).toInt(),
      notificationToken: json['notification_token'] as String,
    );

Map<String, dynamic> _$LogInRequestToJson(LogInRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device': instance.device,
      'device_type': instance.deviceType,
      'notification_token': instance.notificationToken,
    };
