import 'package:flutter/material.dart';

import '../../constant/color.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField(
      {Key? key,
      required this.hitText,
      required this.label,
      required this.prefixIcon,
      required this.emailController,
      required this.onChanged,
      required this.validator,
      required this.obscureText,
      required this.keyboardType,
      required this.suffixIcon})
      : super(key: key);
  final String hitText;
  final String label;
  final Widget prefixIcon;
  final TextEditingController emailController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        controller: emailController,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(label),
          labelStyle: const TextStyle(color: AppColors.white),
          hintText: hitText,
          hintStyle: const TextStyle(color: AppColors.white),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.purple),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
