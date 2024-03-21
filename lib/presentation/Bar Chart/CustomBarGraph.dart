import 'package:aagash_s_application1/presentation/Bar%20Chart/barChartData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarGraph extends StatelessWidget {

  final List data;
  final double yValue;
  CustomBarGraph({required this.data,required this.yValue});

  @override
  Widget build(BuildContext context) {

    ///For example i have used weekly update
    ///You need to initialize the api data to weeklyChartData, better write a switch statement for week,month and day
    WeeklyChartData weeklyData = WeeklyChartData(sunD: data[0], monD: data[1], tueD: data[2], wedD: data[3], thuD: data[4], friD: data[5], satD: data[6]);

    ///After setting the data just call the initialize the function
    weeklyData.initializeBarGraph();

    return BarChart(BarChartData(

      ///Change the y limit according to the needs for example if y is 500 it will change according to it,
      maxY: yValue,

      minY: 0,

      ///Grid
      gridData: FlGridData(show: false),

      ///Tiles
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 30, showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 30, showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 30, showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles:
            SideTitles(
                reservedSize: 30,
                showTitles: true,
              getTitlesWidget: weeksText
            )
        ),
      ),

      ///For border lines
      borderData:  FlBorderData(
        show: false
      ),
      barGroups: weeklyData.barData.map(
              (data) => BarChartGroupData(
                  x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.orange,
                    width: 35,
                    borderRadius: BorderRadius.circular(5),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: yValue,
                    color: Theme.of(context).colorScheme.secondaryContainer
                  )
                )]
              )
      ).toList()
    ));
  }
}
