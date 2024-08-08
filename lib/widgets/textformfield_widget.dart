import 'package:flutter/material.dart';
import 'package:vikn_task/utils/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final BorderRadius borderRadius;

  const CustomTextFormField({
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    required this.borderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior:
            FloatingLabelBehavior.never, // Keeps label in place
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.blueColor,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.blueColor,
            width: 0.5,
          ),
        ),
        filled: true,
        fillColor: Colors.black,
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
