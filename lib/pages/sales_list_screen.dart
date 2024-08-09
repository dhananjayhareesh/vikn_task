import 'package:flutter/material.dart';
import 'package:vikn_task/widgets/custom_appbar_widget.dart';
import 'package:vikn_task/widgets/custom_filterbutton_widget.dart';
import 'package:vikn_task/widgets/custom_searchbar_widget.dart';

class SalesListScreen extends StatelessWidget {
  const SalesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                CustomSearchBar(),
                SizedBox(width: 10),
                Expanded(
                  child: CustomFilterButton(
                    onPressed: () {},
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
            child: ListView.builder(
              itemCount: 10, // Number of list items
              itemBuilder: (context, index) {
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
                                Text(
                                  '#Invoice No',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text('Customer Name'),
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
                                  'Pending',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'SAR.',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('10,000.00')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 0.5, // Thickness of the divider
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.black
                          ], // Gradient colors
                          stops: [
                            0.0,
                            0.5,
                            1.0
                          ], // Adjusting the position of colors
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
