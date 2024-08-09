import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final double width;

  const CustomSearchBar({super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          fillColor: const Color.fromARGB(255, 36, 36, 36),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
