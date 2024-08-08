import 'package:flutter/material.dart';
import 'package:vikn_task/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vikn Sales App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
