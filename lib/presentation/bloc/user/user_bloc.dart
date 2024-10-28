import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy_flutter/data/repository/auth/auth_repository.dart';
import 'package:zippy_flutter/domain/models/responses/user/user_info_model.dart';
import 'package:zippy_flutter/locator.dart';
import 'package:zippy_flutter/presentation/bloc/user/user_event.dart';
import 'package:zippy_flutter/presentation/bloc/user/user_state.dart';
import 'package:zippy_flutter/utils/enum/enum.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final authRepository = locator<IAuthRepository>();

  UserBloc()
      : super(UserState(
            status: StateStatus.initial,
            userInfoModel: UserInfoModel.defaultUser(),
            loggedIn: false,
            errorText: "",
            aboutUs: "",
            privacyPolicy: "",
            enableMyCheckInNotifications: true)) {
    on<LogoutEvent>(_logOut);
  }

  void _logOut(LogoutEvent event, Emitter<UserState> emit) async {
    final result = await authRepository.logOut();
    emit(state.copyWith(status: StateStatus.loading));
    result.fold(
      (error) {},
      (success) {
        emit(state.copyWith(
            status: StateStatus.initial, loggedIn: false, userInfoModel: UserInfoModel.defaultUser(), errorText: ""));
      },
    );
  }
}
