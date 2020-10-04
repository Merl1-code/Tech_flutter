import 'package:flutter/material.dart';
import 'flat_text_field.dart';

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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      borderColor: null,
      focusColor: const Color(0xFFB283FC),
      hintText: hint,
      validator: validator,
    );
  }
}
