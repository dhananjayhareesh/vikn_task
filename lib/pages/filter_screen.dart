import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/widgets/custom_appbar_widget.dart';
import 'package:vikn_task/widgets/filter_containers_widget.dart';
import 'package:vikn_task/controllers/filter_controller.dart';
import 'package:vikn_task/widgets/filter_toggle_widget.dart'; // Import the controller

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final FilterController controller = Get.put(FilterController());

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Filters',
        actions: [
          Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.blue,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Filters',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MonthContainer(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DateContainer(date: '12/09/2023'),
              SizedBox(width: 20),
              DateContainer(date: '12/09/2023'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 0.5,
            color: Color.fromARGB(255, 27, 61, 90),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => ToggleContainer(
                    text: 'Pending',
                    isSelected: controller.isSelected1.value,
                    onTap: () => controller.toggle(1),
                  )),
              const SizedBox(width: 10),
              Obx(() => ToggleContainer(
                    text: 'Invoiced',
                    isSelected: controller.isSelected2.value,
                    onTap: () => controller.toggle(2),
                  )),
              const SizedBox(width: 10),
              Obx(
                () => ToggleContainer(
                  text: 'Cancelled',
                  isSelected: controller.isSelected3.value,
                  onTap: () => controller.toggle(3),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(224, 14, 34, 53),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255, 16, 39, 57))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text('Customer'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blue, Colors.black],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child:
                Align(alignment: Alignment.topLeft, child: CustomerContainer()),
          )
        ],
      ),
    );
  }
}