import 'package:flutter/material.dart';
import 'package:vikn_task/pages/dashboard.dart';
import 'package:vikn_task/pages/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vikn Sales App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/dashboard', page: () => DashboardPage()),
      ],
    );
  }
}
