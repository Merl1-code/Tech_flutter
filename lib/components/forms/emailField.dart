import 'package:flutter/material.dart';
import 'flatTextField.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    this.controller,
  });

  final TextEditingController controller;

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
      hintText: 'Email',
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid email';
        }
        return null;
      },
      errorMessage: null,
    );
  }
}
