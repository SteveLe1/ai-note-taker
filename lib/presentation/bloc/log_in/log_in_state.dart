
import 'package:equatable/equatable.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';

class LoginState extends Equatable {
  final StateStatus status;
  final bool isEnableLoginButton;
  final String error;

  const LoginState({
    required this.status,
    required this.isEnableLoginButton,
    required this.error,
  });

  LoginState copyWith({StateStatus? status,  bool? isEnableLoginButton, String? error}) {
    return LoginState(
      status: status ?? this.status,
      isEnableLoginButton: isEnableLoginButton ?? this.isEnableLoginButton,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        isEnableLoginButton,
        error,
      ];
}
