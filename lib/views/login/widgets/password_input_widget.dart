import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/bloc/login/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final passwordFocusNode;

  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) => current.password != previous.password,
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.text,
            focusNode: passwordFocusNode,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Password', border: OutlineInputBorder()),
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(password: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter password';
              }
              if(value.length <6) {
                return 'password should be at least 6 characters';
              }
              return null;
            },
            onFieldSubmitted: (value) {},
          );
        });
  }
}
