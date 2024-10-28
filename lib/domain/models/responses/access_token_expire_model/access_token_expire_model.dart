import 'package:json_annotation/json_annotation.dart';

part 'access_token_expire_model.g.dart';

@JsonSerializable()
class AccessTokenExpireModel {
  final int? statusCode;
  final String? code;
  final _Details? info;

  AccessTokenExpireModel(this.statusCode, this.code, this.info);

  factory AccessTokenExpireModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenExpireModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenExpireModelToJson(this);
}

@JsonSerializable()
class _Details {
  final int? statusCode;
  final String? message;
  final String? error;

  _Details(this.statusCode, this.message, this.error);

  factory _Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
