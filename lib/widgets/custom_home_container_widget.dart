import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String imagePath;
  final Color containerColor;
  final Color imageBackgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.imagePath,
    this.containerColor = const Color.fromARGB(136, 43, 43, 43),
    this.imageBackgroundColor = const Color.fromARGB(246, 239, 227, 224),
    this.textColor = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: imageBackgroundColor,
              ),
              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, color: textColor),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 20, color: textColor),
                  ),
                  Text(
                    status,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 30,
                    color: textColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
