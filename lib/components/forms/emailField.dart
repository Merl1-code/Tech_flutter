import 'package:flutter/material.dart';
import 'flatTextField.dart';

String _defaultEmailValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter a valid email';
  }
  return null;
}

class EmailField extends StatelessWidget {
  const EmailField({
    this.controller,
    this.hint = 'Email',
    this.validator = _defaultEmailValidator,
  });

  final TextEditingController controller;
  final String hint;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return FlatTextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
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
