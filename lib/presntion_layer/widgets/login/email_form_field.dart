import 'package:flutter/material.dart';
import 'package:shop_app/constant/color.dart';

class EmailFormField extends StatelessWidget {
  final String hitText;
  final String label;
  final Widget prefixIcon;
  final TextEditingController emailController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;

  const EmailFormField(
      {Key? key,
      required this.hitText,
      required this.label,
      required this.prefixIcon,
      required this.emailController,
      required this.onChanged,
      required this.validator,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        controller: emailController,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(color: AppColors.white),
          hintStyle: const TextStyle(color: AppColors.white),
          hintText: hitText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkHeaderClr),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.purple),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}