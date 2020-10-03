import 'package:flutter/material.dart';
import 'FlatTextField.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FlatTextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      textColor: Colors.white,
      backgroundColor: const Color(0xFFC2AEE2),
      borderColor: null,
      focusColor: const Color(0xFFB283FC),
      errorColor: Colors.red,
      hintText: 'Password',
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid password';
        }
        return null;
      },
      errorMessage: null,
    );
  }
}
