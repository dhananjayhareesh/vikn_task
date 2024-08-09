import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DateContainer extends StatelessWidget {
  final String date;

  const DateContainer({
    Key? key,
    required this.date,
  }) : super(key: key);

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
          Icon(
            IconlyBold.calendar,
            size: 20,
            color: Colors.blue,
          ),
          const SizedBox(width: 5), // Space between icon and text
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
  const MonthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(224, 14, 34, 53),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
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
  const CustomerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      decoration: BoxDecoration(
        color: const Color.fromARGB(224, 14, 34, 53),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
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
