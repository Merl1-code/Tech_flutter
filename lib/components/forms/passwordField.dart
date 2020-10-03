import 'package:flutter/material.dart';
import 'flatTextField.dart';

String _defaultValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter a valid password';
  }
  return null;
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    this.controller,
    this.hint = 'Password',
    this.validator = _defaultValidator,
    this.hidden = false,
  });

  final TextEditingController controller;
  final String hint;
  final String Function(String) validator;
  final bool hidden;

  @override
  Widget build(BuildContext context) {
    return FlatTextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: hidden,
      textColor: Colors.white,
      backgroundColor: const Color(0xFFC2AEE2),
      borderColor: null,
      focusColor: const Color(0xFFB283FC),
      errorColor: Colors.red,
      hintText: hint,
      validator: validator,
    );
  }
}
