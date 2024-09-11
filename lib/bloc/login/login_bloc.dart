import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/repository/auth/login_repository.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/utils/enums.dart';

part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository = LoginRepository();

  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {"email": state.email, "password": state.password};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginRepository.loginApi(data).then((value) {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            message: value.error.toString(),
            postApiStatus: PostApiStatus.error));
      } else {
        emit(state.copyWith(
            message: "Login successful", postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
