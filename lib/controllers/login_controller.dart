import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken != null) {
      Get.offNamed('/main');
    } else {
      Get.offNamed('/login');
    }
  }

  Future<void> login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'is_mobile': true,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == 6000) {
          await secureStorage.write(
              key: 'accessToken', value: data['data']['access']);
          await secureStorage.write(
              key: 'refreshToken', value: data['data']['refresh']);
          await secureStorage.write(
              key: 'userId', value: data['data']['user_id'].toString());

          Get.offNamed('/main');
        } else {
          final errorMessage = data['message'] ?? "Email or Password incorrect";
          Get.snackbar("Login Failed", errorMessage);
        }
      } else {
        Get.snackbar("Error", "Failed to login. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await secureStorage.deleteAll();
    clearFields();
    Get.offAllNamed('/');
  }

  void clearFields() {
    usernameController.clear();
    passwordController.clear();
  }
}
