import 'package:flutter/material.dart';
import 'flat_text_field.dart';

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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      borderColor: null,
      focusColor: const Color(0xFFB283FC),
      hintText: hint,
      validator: validator,
    );
  }
}
