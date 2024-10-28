import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coconut_note/data/repository/auth/auth_repository.dart';
import 'package:coconut_note/domain/models/responses/user/user_info_model.dart';
import 'package:coconut_note/locator.dart';
import 'package:coconut_note/presentation/bloc/user/user_event.dart';
import 'package:coconut_note/presentation/bloc/user/user_state.dart';
import 'package:coconut_note/utils/enum/enum.dart';

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
