import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2_2_3_package_test/screens/ConfigColor.dart';
List<FlSpot> spotsInAYear = [
  FlSpot(0, 1),
  FlSpot(1, 1.5),
  FlSpot(2, 1.4),
  FlSpot(3, 3.4),
  FlSpot(4, 2),
  FlSpot(5, 2.2),
  FlSpot(6, 1.8),
  FlSpot(7, 1.8),
  FlSpot(8, 1),
  FlSpot(9, 1.5),
  FlSpot(10, 1.4),
  FlSpot(11, 3.4),
  FlSpot(12, 2),
];
List<FlSpot> sportInYears = [
  FlSpot(2021, 1),
  FlSpot(2022, 1.5),
  FlSpot(2023, 4.4),
  FlSpot(2024, 2),
];

class ChartScreen extends StatelessWidget {
  ChartScreen({key});



  LineChartData lineChartData = new LineChartData(
    backgroundColor: ConfigColor.secondaryColor.withOpacity(0.3),
    lineTouchData: LineTouchData(
      enabled: true,
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: ConfigColor.primaryColor,
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map((barSpot) {
            return LineTooltipItem(
              '${barSpot.y.toString()} point',
              TextStyle(color: Colors.white),
            );
          }).toList();
        },
      ),
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles:SideTitles(
        showTitles: true,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1';
            case 2:
              return '2';
            case 3:
              return '3';
            case 4:
              return '4';
            case 5:
              return '5';
            default:
              return '';
          }
        },
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        getTitles: (value) {
         return '${value.toInt()}';
        },
      ),
    ),
    lineBarsData: [
      LineChartBarData(
        spots: spotsInAYear,
        isCurved: true,
        preventCurveOverShooting: true,
        // giúp đồ thị không bị vượt quá giới hạn
        colors: [
          ConfigColor.primaryColor,
        ],
        barWidth: 2,
        dotData: FlDotData(show: true), // hiển thị điểm
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150),
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: LineChart(lineChartData),
          ),
        ],
      ),
    );
  }
}
