
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors/colors.dart';
// import 'package:flutter_application_1/features/auth/validators/auth_validators.dart';

class Textfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final DatePickerDialog? datePickerDialog;
  final String? Function(String?)? validator;

  const Textfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.datePickerDialog,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: datePickerDialog != null,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.textfieldColor,
        prefixIcon: icon != null
            ? Icon(icon, color: AppColors.buttomAddButtom)
            : null,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.buttomAddButtom),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
    );
  }
}
