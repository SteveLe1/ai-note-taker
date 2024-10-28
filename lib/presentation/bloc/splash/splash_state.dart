part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashStateInitial extends SplashState {
  const SplashStateInitial();
}

class SplashStateLoading extends SplashState {}

class SplashStateSuccess extends SplashState {}

class SplashStateError extends SplashState {
  final String error;

  const SplashStateError({required this.error});

  @override
  List<Object> get props => [error];
}

class RedirectToHomeScreenState extends SplashState{
  final String? token;

  const RedirectToHomeScreenState(this.token);
}
