part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

class ChangeEmailEvent extends LogInEvent {
  final String email;

  const ChangeEmailEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class ChangePasswordEvent extends LogInEvent {
  final String password;

  const ChangePasswordEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginAppEvent extends LogInEvent {
  @override
  List<Object> get props => [];
}