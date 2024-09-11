part of 'login_bloc.dart';

class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvents {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvents {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];
}

class EmailUnfocused extends LoginEvents {}

class PasswordUnfocused extends LoginEvents {}

class LoginApi extends LoginEvents {}
