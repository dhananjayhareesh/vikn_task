import 'package:flutter/material.dart';
import 'package:vikn_task/controllers/login_controller.dart';
import 'package:vikn_task/pages/filter_screen.dart';
import 'package:vikn_task/pages/home_screen.dart';
import 'package:vikn_task/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:vikn_task/pages/main_screen.dart';
import 'package:vikn_task/pages/profile_screen.dart';
import 'package:vikn_task/pages/sales_list_screen.dart';
import 'package:vikn_task/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final LoginController loginController = Get.put(LoginController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vikn Sales App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
        GetPage(name: '/sales', page: () => SalesListScreen()),
        GetPage(name: '/filter', page: () => FilterScreen())
      ],
    );
  }
}
