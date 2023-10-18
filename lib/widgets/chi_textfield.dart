import 'package:flutter/material.dart';

class CHITextField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType keyBordType;
  const CHITextField({
    super.key,
    this.hintText,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.keyBordType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        focusedBorder: _fieldBorder(),
        enabledBorder: _fieldBorder(),
        disabledBorder: _fieldBorder(),
        focusedErrorBorder: _fieldBorder(Colors.red),
        errorBorder: _fieldBorder(Colors.red),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }

  OutlineInputBorder _fieldBorder([Color? borderColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: borderColor ?? Colors.orange),
    );
  }
}
