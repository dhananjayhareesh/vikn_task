import 'package:flutter/material.dart';
import 'package:vikn_task/utils/constants/colors.dart';
import 'package:vikn_task/utils/constants/textstyle.dart';
import 'package:vikn_task/utils/strings/logintext.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final BorderRadius borderRadius;
  final TextEditingController? controller;

  const CustomTextFormField({
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    required this.borderRadius,
    this.controller,
    super.key,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: AppColors.blueColor),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: const BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: const BorderSide(
            color: AppColors.blueColor,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: const BorderSide(
            color: AppColors.blueColor,
            width: 0.5,
          ),
        ),
        filled: true,
        fillColor: Colors.black,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blueColor,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

Positioned language() {
  return Positioned(
    top: 40,
    right: 20,
    child: Row(
      children: [
        Image.asset(
          'assets/translate.png',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Text(
          LoginText.lang,
          style: AppText.smallWhite,
        ),
      ],
    ),
  );
}
