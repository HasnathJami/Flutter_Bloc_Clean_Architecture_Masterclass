part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.postApiStatus = ApiStatus.initial});

  final String email;
  final String password;
  final String message;
  final ApiStatus postApiStatus;

  LoginStates copyWith(
      {String? email,
      String? password,
      String? message,
      ApiStatus? postApiStatus}) {
    return LoginStates(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [email, password, message, postApiStatus];
}
