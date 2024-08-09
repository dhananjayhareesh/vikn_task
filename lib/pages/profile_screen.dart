import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/controllers/login_controller.dart';
import 'package:vikn_task/controllers/profile_controller.dart';
import 'package:vikn_task/widgets/profile_inside_container.dart';
import 'package:vikn_task/widgets/profile_option_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    final List<Map<String, String>> helpItems = [
      {'image': 'assets/help.png', 'text': 'Help'},
      {'image': 'assets/faq.png', 'text': 'FAQ'},
      {'image': 'assets/invite.png', 'text': 'Invite Frinds'},
      {'image': 'assets/terms.png', 'text': 'Terms of services'},
      {'image': 'assets/privacy.png', 'text': 'Privacy Policy'},
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(135, 62, 62, 62),
                  ),
                  height: 370,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: controller.profilePicture.value.isEmpty
                                    ? Image.asset('assets/profileimg.png')
                                    : Image.network(
                                        controller.profilePicture.value,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/errorImage.png');
                                        },
                                      ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.userName.value.isEmpty
                                      ? 'Loading...'
                                      : controller.userName.value,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  controller.email.value.isEmpty
                                      ? 'Loading...'
                                      : controller.email.value,
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Image.asset('assets/edit.png'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ProfileInsideContainer(
                          onLogoutTap: () =>
                              _showLogoutDialog(context, controller),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () => _showLogoutDialog(context, controller),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/logout.png'),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ProfileOptionWidgets(helpItems: helpItems),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, ProfileController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Get.find<LoginController>().logout();
                Navigator.of(context).pop();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
