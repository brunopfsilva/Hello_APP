import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CheckInChartWidget extends StatelessWidget {
  const CheckInChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: 8,
                getTooltipItem: (BarChartGroupData group, int groupIndex,
                    BarChartRodData rod, int rodIndex) {
                  return BarTooltipItem(
                    rod.toY.round().toString(),
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            // titlesData: FlTitlesData(
            //   show: true,
            //   bottomTitles: SideTitles(
            //     showTitles: true,
            //     getTextStyles: (_, value) => const TextStyle(
            //       color: Color(0xff7589a2),
            //       fontWeight: FontWeight.bold,
            //       fontSize: 14,
            //     ),
            //     margin: 20,
            //     getTitles: (double value) {
            //       return (value.toInt() + 1).toString();
            //     },
            //   ),
            //   leftTitles: SideTitles(showTitles: false),
            // ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              //   BarChartGroupData(
              //     x: 0,
              //     barRods: [
              //       BarChartRodData(
              //         y: 8,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
              //   BarChartGroupData(
              //     x: 1,
              //     barRods: [
              //       BarChartRodData(
              //         y: 10,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
              //   BarChartGroupData(
              //     x: 2,
              //     barRods: [
              //       BarChartRodData(
              //         y: 14,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
              //   BarChartGroupData(
              //     x: 3,
              //     barRods: [
              //       BarChartRodData(
              //         y: 15,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
              //   BarChartGroupData(
              //     x: 4,
              //     barRods: [
              //       BarChartRodData(
              //         y: 13,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
              //   BarChartGroupData(
              //     x: 5,
              //     barRods: [
              //       BarChartRodData(
              //         y: 10,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
              //   BarChartGroupData(
              //     x: 5,
              //     barRods: [
              //       BarChartRodData(
              //         y: 10,
              //         colors: [Colors.lightBlueAccent],
              //         borderRadius: const BorderRadius.all(Radius.zero),
              //         width: 20.0,
              //       ),
              //     ],
              //     showingTooltipIndicators: [0],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
