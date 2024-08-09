import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/widgets/custom_home_container_widget.dart';
import 'package:vikn_task/widgets/home_appbar_widget.dart';
import 'package:vikn_task/widgets/revenue_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RevenueContainer(),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                title: 'Booking',
                subtitle: '123',
                status: 'Reserved',
                imagePath: 'assets/sticker.png',
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                imageBackgroundColor: const Color.fromARGB(255, 197, 244, 198),
                title: 'Invoice',
                subtitle: '10,232.00',
                status: 'Rupees',
                imagePath: 'assets/moneybag.png',
                onTap: () {
                  Get.toNamed('/sales');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
