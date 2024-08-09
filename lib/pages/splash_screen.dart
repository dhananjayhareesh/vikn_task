import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/controllers/login_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();

    // Introduce a delay before navigating
    Future.delayed(const Duration(seconds: 3), () {
      loginController.checkLoginStatus();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen image here
            Image.asset(
              'assets/applogo.png', // Replace with your image path
              width: 150, // Adjust the size as needed
              height: 150,
            ),
            const SizedBox(height: 20),
            // Optional: Add a loading indicator below the image
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
