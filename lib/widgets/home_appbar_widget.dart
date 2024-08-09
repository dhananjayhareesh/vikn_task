import 'package:flutter/material.dart';

class HomeAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const HomeAppbarWidget({super.key, this.height = 80.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      title: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset('assets/applogo.png', height: 40),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset('assets/user.png', height: 60),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
