import 'package:flutter/material.dart';

class ProfileInsideContainer extends StatelessWidget {
  final VoidCallback onLogoutTap;

  const ProfileInsideContainer({Key? key, required this.onLogoutTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                  ),
                  child: Center(
                    child: Image.asset('assets/stars.png'),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('4.2'),
                        SizedBox(width: 1),
                        Icon(Icons.star, size: 15),
                      ],
                    ),
                    Text(
                      '2,211',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'rides',
                      style: TextStyle(color: Colors.blue[100]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Container(
          height: 100,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[100],
                  ),
                  child: Center(
                    child: Image.asset('assets/shield-tick.png'),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('KYC'),
                        SizedBox(width: 1),
                        Icon(Icons.verified_outlined, size: 15),
                      ],
                    ),
                    Text(
                      'Verified',
                      style: TextStyle(color: Colors.blue[100]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}