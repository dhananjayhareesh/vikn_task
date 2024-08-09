import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/controllers/bottom_navigation_controller.dart';
import 'package:vikn_task/pages/home_screen.dart';
import 'package:vikn_task/pages/profile_screen.dart';
import 'package:vikn_task/widgets/custom_botton_navbar_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavController =
        Get.put(BottomNavigationController());

    return Scaffold(
      body: Obx(
        () {
          switch (bottomNavController.selectedIndex.value) {
            case 0:
              return HomeScreen();
            case 1:
              return Container();
            case 2:
              return Container();
            case 3:
              return ProfileScreen();
            default:
              return HomeScreen();
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
