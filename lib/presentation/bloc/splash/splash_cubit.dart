import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy_flutter/data/repository/auth/auth_repository.dart';
import 'package:zippy_flutter/data/repository/local/local_repository.dart';
import 'package:zippy_flutter/locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final authRepository = locator<IAuthRepository>();
  final localRepository = locator<ILocalRepository>();

  SplashCubit() : super(const SplashStateInitial());

  init() async {
    await checkToken();
  }

  Future<void> isFirstOpenApp() async {
    emit(SplashStateLoading());
    final result = await authRepository.isFirstOpenApp("example@gmail.com");
    result.fold(
      (l) {
        emit(SplashStateError(error: '$l'));
      },
      (success) {
        emit(SplashStateSuccess());
      },
    );
  }

  Future<void> checkToken() async {
    final token = await getAccessToken();
    emit(RedirectToHomeScreenState(token));
  }

  Future<String?> getAccessToken() async {
    return await localRepository.getAccessToken();
  }
}
