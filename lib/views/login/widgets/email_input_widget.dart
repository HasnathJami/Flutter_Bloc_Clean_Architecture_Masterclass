import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {
  final emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: emailFocusNode,
      decoration: const InputDecoration(
          hintText: 'Email', border: OutlineInputBorder()),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter email';
        }
        return null;
      },
      onFieldSubmitted: (value) {},
    );
  }
}
