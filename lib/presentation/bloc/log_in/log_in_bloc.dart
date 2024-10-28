import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy_flutter/data/repository/auth/auth_repository.dart';
import 'package:zippy_flutter/domain/models/requests/log_in/log_in_request.dart';
import 'package:zippy_flutter/domain/models/responses/error_model/zp_base_error_model.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/locator.dart';
import 'package:zippy_flutter/presentation/bloc/log_in/log_in_state.dart';
import 'package:zippy_flutter/utils/device_id/device_id.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';
import 'package:zippy_flutter/utils/extensions/validate_utils.dart';

part 'log_in_event.dart';

class LogInBloc extends Bloc<LogInEvent, LoginState> {
  final authRepository = locator<IAuthRepository>();

  String emailValue = "";
  String passwordValue = "";

  LogInBloc()
      : super(const LoginState(
          status: StateStatus.initial,
          isEnableLoginButton: false,
          error: "",
        )) {
    on<ChangeEmailEvent>((event, emit) {
      emailValue = event.email;
      checkValidateLogin(emit);
    });

    on<ChangePasswordEvent>((event, emit) {
      passwordValue = event.password;
      checkValidateLogin(emit);
    });
    on<LoginAppEvent>(login);
  }

  Future<void> login(LoginAppEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    LogInRequest logInRequest = LogInRequest(
        email: emailValue,
        password: passwordValue,
        device: await getDeviceId() ?? "",
        deviceType: getPlatformDevice(),
        notificationToken: "");
    final login = await authRepository.logIn(logInRequest);
    login.fold(
      (error) {
        emit(state.copyWith(status: StateStatus.failure, isEnableLoginButton: true, error: error.toString()));
      },
      (success) {
        emit(state.copyWith(status: StateStatus.success, isEnableLoginButton: true, error: ""));
      },
    );
  }

  checkValidateLogin(Emitter<LoginState> emit) {
    if (isEmailPasswordValid()) {
      emit(state.copyWith(status: StateStatus.initial, isEnableLoginButton: true, error: ""));
    } else {
      emit(state.copyWith(status: StateStatus.initial, isEnableLoginButton: false, error: ""));
    }
  }

  bool isEmailPasswordValid() {
    return emailValue.isNotEmpty && passwordValue.isNotEmpty;
  }
}
