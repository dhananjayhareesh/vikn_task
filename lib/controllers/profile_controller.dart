import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileController extends GetxController {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  var userName = ''.obs;
  var email = ''.obs;
  var profilePicture = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      String? userId = await secureStorage.read(key: 'userId');
      String? accessToken = await secureStorage.read(key: 'accessToken');

      final response = await http.get(
        Uri.parse(
            'https://www.api.viknbooks.com/api/v10/users/user-view/$userId/'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        userName.value =
            data['data']['first_name'] + ' ' + data['data']['last_name'];
        email.value = data['data']['email'];
        profilePicture.value = data['customer_data']['photo'];
      } else {
        Get.snackbar("Error", "Failed to load profile data");
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred");
    }
  }

  void logout() async {
    await secureStorage.deleteAll();
    Get.offNamed('/login');
  }
}
