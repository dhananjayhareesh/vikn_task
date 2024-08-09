import 'package:flutter/material.dart';

class ProfileOptionWidgets extends StatelessWidget {
  final List<Map<String, String>> helpItems;

  const ProfileOptionWidgets({super.key, required this.helpItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: helpItems.length,
      itemBuilder: (context, index) {
        return Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(helpItems[index]['image']!),
              SizedBox(width: 20),
              Text(helpItems[index]['text']!),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
