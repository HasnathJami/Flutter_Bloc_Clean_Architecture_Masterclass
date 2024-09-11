part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates({this.email = '', this.password = ''});

  final String email;
  final String password;

  LoginStates copyWith({String? email, String? password}) {
    return LoginStates(
        email: email ?? this.email, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, password];
}
