import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/utils/enums.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) {
        return previous.postApiStatus != current.postApiStatus;
      },
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text("submitting...")));
        }

        if (state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Success:${state.message}")));
        }

        if (state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("SuccessError:${state.message}")));
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
          buildWhen: (current, previous) => false,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginApi());
                  }
                },
                child: const Text('Login'));
          }),
    );
  }
}
