import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DateContainer extends StatelessWidget {
  final String date;

  const DateContainer({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(224, 14, 34, 53),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            IconlyBold.calendar,
            size: 20,
            color: Colors.blue,
          ),
          const SizedBox(width: 5),
          Text(
            date,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class MonthContainer extends StatelessWidget {
  const MonthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(224, 14, 34, 53),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'This Month',
            style: TextStyle(fontSize: 12),
          ),
          Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }
}

class CustomerContainer extends StatelessWidget {
  const CustomerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      decoration: BoxDecoration(
        color: const Color.fromARGB(224, 14, 34, 53),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Savad farooque',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.close,
            color: Colors.blue,
            size: 20,
          ),
        ],
      ),
    );
  }
}
