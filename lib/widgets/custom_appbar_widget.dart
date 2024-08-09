import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double elevation;
  final double toolbarHeight;

  CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.elevation = 0.0,
    this.toolbarHeight = 70.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      toolbarHeight: toolbarHeight,
      elevation: elevation,
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color.fromARGB(255, 27, 61, 90),
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
