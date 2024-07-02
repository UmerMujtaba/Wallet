import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class LineGraphChart extends StatelessWidget {
  LineGraphChart({super.key});

  //Generate some dummy data for the cahrt This will be used to draw the red line

  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  //This will be used to draw the orange line

  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  }); // This will be used to draw the blue line

  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: dummyData1,
              isCurved: true,
              barWidth: 3,
              color: Colors.indigo,
            ),
            LineChartBarData(
              spots: dummyData2,
              isCurved: true,
              barWidth: 3,
              color: Colors.red,
            ),
            LineChartBarData(
              spots: dummyData3,
              isCurved: false,
              barWidth: 3,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}