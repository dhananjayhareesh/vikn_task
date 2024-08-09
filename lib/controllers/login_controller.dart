import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<void> login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    // print("Attempting to log in with username: $username");

    if (username.isEmpty || password.isEmpty) {
      // print("Username or password is empty");
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    try {
      // print("Sending login request");

      final response = await http.post(
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'is_mobile': true,
        }),
      );

      // print("Response status: ${response.statusCode}");
      // print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == 6000) {
          // print("Login successful");

          await secureStorage.write(
              key: 'accessToken', value: data['data']['access']);
          await secureStorage.write(
              key: 'refreshToken', value: data['data']['refresh']);
          await secureStorage.write(
              key: 'userId', value: data['data']['user_id'].toString());

          // print("Tokens and user ID saved");

          Get.offNamed('/main');
        } else {
          final errorMessage = data['message'] ?? "Email or Password incorrect";
          // print("Login failed: $errorMessage");
          Get.snackbar("Login Failed", errorMessage);
        }
      } else {
        // print("Failed to login. Status code: ${response.statusCode}");
        Get.snackbar("Error", "Failed to login. Please try again.");
      }
    } catch (e) {
      // print("Exception occurred: $e");
      Get.snackbar("Error", "An unexpected error occurred");
    }
  }
}
