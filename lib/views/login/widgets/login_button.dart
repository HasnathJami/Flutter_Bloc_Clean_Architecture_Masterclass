import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/bloc/login/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>
      (
        buildWhen: (current, previous) => false,
        builder: (context, state) {
      return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // print('I am here');
              if(state.password.length < 6)
              print('please enter password greater than 6');
            }
          },
          child: const Text('Login'));
    });
  }
}
