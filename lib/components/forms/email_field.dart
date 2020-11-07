import 'package:flutter/material.dart';
import 'flat_text_field.dart';

String _defaultEmailValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter an email';
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Email is incorrect';
  }
  return null;
}

const Color _defBackgroundColor = Color(0xFFC2AEE2);

class EmailField extends StatelessWidget {
  const EmailField({
    this.controller,
    this.hint = 'Email',
    this.validator = _defaultEmailValidator,
    this.textColor = Colors.white,
    this.backgroundColor = _defBackgroundColor,
  });

  final TextEditingController controller;
  final String hint;
  final String Function(String) validator;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FlatTextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
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
