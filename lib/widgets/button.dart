import 'package:flutter/material.dart';
import 'package:vikn_task/utils/constants/colors.dart';
import 'package:vikn_task/utils/constants/textstyle.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sign In',
              style: AppText.smallWhite,
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
