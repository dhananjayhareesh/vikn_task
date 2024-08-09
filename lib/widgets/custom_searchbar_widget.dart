import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final double width;
  final ValueChanged<String> onChanged;

  const CustomSearchBar({super.key, this.width = 200, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          fillColor: const Color.fromARGB(255, 36, 36, 36),
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
