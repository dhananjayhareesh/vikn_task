import 'package:flutter/material.dart';

class CustomFilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  const CustomFilterButton({
    super.key,
    required this.onPressed,
    this.label = 'Add filter',
    this.icon = Icons.filter_list,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.blue),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        padding: const EdgeInsets.symmetric(vertical: 11.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
