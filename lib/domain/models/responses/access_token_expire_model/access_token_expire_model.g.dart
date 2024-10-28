// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_expire_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenExpireModel _$AccessTokenExpireModelFromJson(
        Map<String, dynamic> json) =>
    AccessTokenExpireModel(
      (json['statusCode'] as num?)?.toInt(),
      json['code'] as String?,
      json['info'] == null
          ? null
          : _Details.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessTokenExpireModelToJson(
        AccessTokenExpireModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'code': instance.code,
      'info': instance.info,
    };

_Details _$DetailsFromJson(Map<String, dynamic> json) => _Details(
      (json['statusCode'] as num?)?.toInt(),
      json['message'] as String?,
      json['error'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(_Details instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
