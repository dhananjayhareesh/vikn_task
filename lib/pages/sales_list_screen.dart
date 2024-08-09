import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/controllers/saleslist_controller.dart';
import 'package:vikn_task/pages/filter_screen.dart';
import 'package:vikn_task/widgets/custom_appbar_widget.dart';
import 'package:vikn_task/widgets/custom_filterbutton_widget.dart';
import 'package:vikn_task/widgets/custom_searchbar_widget.dart';

class SalesListScreen extends StatelessWidget {
  const SalesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesController controller = Get.put(SalesController());

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Invoices',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Row(
              children: [
                CustomSearchBar(
                  onChanged: (value) => controller.searchSales(value),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomFilterButton(
                    onPressed: () {
                      Get.to(FilterScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: const Color.fromARGB(255, 27, 61, 90),
            thickness: 0.5,
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.salesList.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.filteredSalesList.isEmpty) {
                return Center(child: Text('No data found'));
              }

              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!controller.isLastPage.value &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    controller.fetchSales();
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: controller.filteredSalesList.length +
                      (controller.isLastPage.value ? 0 : 1),
                  itemBuilder: (context, index) {
                    if (index == controller.filteredSalesList.length) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final sale = controller.filteredSalesList[index];
                    // Determine color based on sale status
                    Color statusColor;
                    switch (sale['Status']) {
                      case 'Invoiced':
                        statusColor = Colors.blue;
                        break;
                      case 'Pending':
                        statusColor = Colors.red;
                        break;
                      case 'Cancelled':
                        statusColor = Colors.grey;
                        break;
                      default:
                        statusColor = Colors.black; // Default color
                    }

                    return Column(
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('#${sale['VoucherNo']}',
                                        style: TextStyle(fontSize: 12)),
                                    Text(
                                      sale['CustomerName'],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      sale['Status'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: statusColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text('SAR.',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text('${sale['GrandTotal_Rounded']}'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
