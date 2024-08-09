import 'package:flutter/material.dart';
import 'package:vikn_task/widgets/graph_widget.dart';

class RevenueContainer extends StatelessWidget {
  const RevenueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(136, 43, 43, 43),
      ),
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'SAR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '278,000.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '+21%',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'than last month',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 10,
            right: 20,
            child: Text(
              'Revenue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              right: 20,
              left: 20,
              bottom: 40,
            ),
            child: LineChartWidget(),
          ),
        ],
      ),
    );
  }
}
