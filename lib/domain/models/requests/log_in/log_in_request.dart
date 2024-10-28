import 'package:json_annotation/json_annotation.dart';

part 'log_in_request.g.dart';

@JsonSerializable()
class LogInRequest{
  final String email;
  final String password;
  final String device;
  @JsonKey(name: "device_type")
  final int deviceType;
  @JsonKey(name: "notification_token")
  final String notificationToken;


  LogInRequest({required this.email, required this.password, required this.device, required this.deviceType, required this.notificationToken});

  factory LogInRequest.fromJson(Map<String, dynamic> json) =>
      _$LogInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogInRequestToJson(this);
}