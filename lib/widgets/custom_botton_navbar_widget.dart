import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/controllers/bottom_navigation_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavController =
        Get.find<BottomNavigationController>();

    return Obx(
      () => BottomNavigationBar(
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: bottomNavController.changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              color: bottomNavController.selectedIndex.value == 0
                  ? Colors.white
                  : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/route.png',
              color: bottomNavController.selectedIndex.value == 1
                  ? Colors.white
                  : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/notification.png',
              color: bottomNavController.selectedIndex.value == 2
                  ? Colors.white
                  : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/profile.png',
              color: bottomNavController.selectedIndex.value == 3
                  ? Colors.white
                  : Colors.grey,
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
      ),
    );
  }
}
