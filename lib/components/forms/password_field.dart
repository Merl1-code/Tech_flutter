import 'package:flutter/material.dart';
import 'flat_text_field.dart';

String _defaultValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter a valid password';
  } else if (value.length < 8) {
    return 'Password should be at least 8 characters';
  }
  return null;
}

const Color _defBackgroundColor = Color(0xFFC2AEE2);

class PasswordField extends StatelessWidget {
  const PasswordField({
    this.controller,
    this.hint = 'Password',
    this.validator = _defaultValidator,
    this.hidden = true,
    this.textColor = Colors.white,
    this.backgroundColor = _defBackgroundColor,
  });

  final TextEditingController controller;
  final String hint;
  final String Function(String) validator;
  final bool hidden;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FlatTextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: hidden,
      textColor: textColor,
      backgroundColor: backgroundColor,
      borderColor: null,
      focusColor: const Color(0xFFB283FC),
      errorColor: Colors.red,
      hintText: hint,
      validator: validator,
    );
  }
}
