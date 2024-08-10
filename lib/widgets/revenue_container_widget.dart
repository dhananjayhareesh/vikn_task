import 'package:flutter/material.dart';
import 'package:vikn_task/utils/constants/colors.dart';
import 'package:vikn_task/utils/constants/textstyle.dart';
import 'package:vikn_task/utils/strings/hometext.dart';
import 'package:vikn_task/widgets/graph_widget.dart';

class RevenueContainer extends StatelessWidget {
  const RevenueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.containerColor,
      ),
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Hometext.left1,
                      style: AppText.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      Hometext.left2,
                      style: AppText.smallWhite,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      Hometext.left21,
                      style: AppText.smallGreen,
                    ),
                    const SizedBox(width: 5),
                    Text(Hometext.left4, style: AppText.smallGrey),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: Text(
              Hometext.revenue,
              style: AppText.smallWhite,
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
