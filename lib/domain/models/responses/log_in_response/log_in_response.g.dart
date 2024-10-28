// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInResponse _$LogInResponseFromJson(Map<String, dynamic> json) =>
    LogInResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogInResponseToJson(LogInResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['accessToken'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };
