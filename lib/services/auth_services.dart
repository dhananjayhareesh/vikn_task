import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<bool> login(String username, String password) async {
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
        await secureStorage.write(
            key: 'accessToken', value: data['data']['access']);
        await secureStorage.write(
            key: 'refreshToken', value: data['data']['refresh']);
        await secureStorage.write(
            key: 'userId', value: data['data']['user_id'].toString());
        return true;
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar(
            "Login Failed", errorData['message'] ?? "An error occurred");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred");
      return false;
    }
  }
}
