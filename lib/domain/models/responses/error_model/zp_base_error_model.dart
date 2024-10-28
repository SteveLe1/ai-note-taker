import 'package:json_annotation/json_annotation.dart';

part 'zp_base_error_model.g.dart';

@JsonSerializable()
class ZPBaseErrorModel {
  final int statusCode;
  final String message;

  ZPBaseErrorModel(this.statusCode, this.message);

  factory ZPBaseErrorModel.fromJson(Map<String, dynamic> json) => _$ZPBaseErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ZPBaseErrorModelToJson(this);
}
