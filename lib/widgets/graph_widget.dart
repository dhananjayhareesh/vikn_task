import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vikn_task/widgets/line_title.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color.fromARGB(255, 3, 153, 204),
    const Color.fromARGB(255, 26, 27, 26),
  ];

  LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        titlesData: LineTitle.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(
          show: false, // Hide the X and Y axis lines
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 1),
              const FlSpot(2.5, 2),
              const FlSpot(4.8, 5),
              const FlSpot(6.4, 2.5),
              const FlSpot(8, 4),
              const FlSpot(9.5, 3),
              const FlSpot(11, 4),
            ],
            isCurved: true,
            dotData: const FlDotData(show: false),
            color: Colors.blue,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.2))
                    .toList(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
