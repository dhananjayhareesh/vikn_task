import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitle {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: (value, meta) {
              TextStyle style = TextStyle(
                color: Colors.white, // White text for better contrast
                fontSize: 12,
              );

              Widget text;
              switch (value.toInt()) {
                case 0:
                  text = Text('01', style: style);
                  break;
                case 2:
                  text = Text('02', style: style);
                  break;
                case 4:
                  text = Text('03', style: style);
                  break;
                case 6:
                  text = Text('04', style: style);
                  break;
                case 8:
                  text = Text('05', style: style);
                  break;
                case 10:
                  text = Text('06', style: style);
                  break;
                default:
                  return SizedBox.shrink();
              }

              return Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 29, 29),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: text,
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              TextStyle style = TextStyle(
                color: Colors.grey,
                fontSize: 12,
              );

              switch (value.toInt()) {
                case 1:
                  return Text('  0', style: style);
                case 2:
                  return Text('1k', style: style);
                case 3:
                  return Text('2k', style: style);
                case 4:
                  return Text('3k', style: style);
                case 5:
                  return Text('4k', style: style);
                default:
                  return Text('', style: style);
              }
            },
            // reservedSize: 50,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );
}
