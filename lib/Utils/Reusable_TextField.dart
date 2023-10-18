import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Color borderColor;
  final TextInputType inputType;
  final bool obscureText;
  final IconData prefixIcon;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.borderColor,
      required this.inputType,
      required this.obscureText,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        hintStyle: const TextStyle(
            // fontWeight: FontWeight.bold,
            ),
        hintText: hint,
      ),
    );
  }
}
