// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zp_base_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZPBaseErrorModel _$ZPBaseErrorModelFromJson(Map<String, dynamic> json) =>
    ZPBaseErrorModel(
      (json['statusCode'] as num).toInt(),
      json['message'] as String,
    );

Map<String, dynamic> _$ZPBaseErrorModelToJson(ZPBaseErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
