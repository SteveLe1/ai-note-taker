import 'package:json_annotation/json_annotation.dart';

part 'log_in_response.g.dart';

@JsonSerializable()
class LogInResponse {
  final Data data;

  LogInResponse(this.data);

  factory LogInResponse.fromJson(Map<String, dynamic> json) => _$LogInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogInResponseToJson(this);
}

@JsonSerializable()
class Data {
  final String accessToken;

  Data(this.accessToken);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
