import 'package:aagash_s_application1/core/app_export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'individualBar.dart';

class WeeklyChartData{

  final double sunD;
  final double monD;
  final double tueD;
  final double wedD;
  final double thuD;
  final double friD;
  final double satD;

  WeeklyChartData({
    required this.sunD,
    required this.monD,
    required this.tueD,
    required this.wedD,
    required this.thuD,
    required this.friD,
    required this.satD,
  });

  List<IndividualBar> barData = [];

  void initializeBarGraph(){
    barData = [
      IndividualBar(x: 1, y: sunD),
      IndividualBar(x: 2, y: monD),
      IndividualBar(x: 3, y: tueD),
      IndividualBar(x: 4, y: wedD),
      IndividualBar(x: 5, y: thuD),
      IndividualBar(x: 6, y: friD),
      IndividualBar(x: 7, y: satD),
    ];
  }
}

class MonthlyChartData{

  final double jan;
  final double feb;
  final double mar;
  final double apr;
  final double may;
  final double jun;
  final double jly;
  final double aug;
  final double sep;
  final double oct;
  final double nov;
  final double dec;

  MonthlyChartData({
    required this.jan,
    required this.feb,
    required this.mar,
    required this.apr,
    required this.may,
    required this.jun,
    required this.jly,
    required this.aug,
    required this.sep,
    required this.oct,
    required this.nov,
    required this.dec,
  });

}

class DailyChartData {

  final double hour1;
  final double hour2;
  final double hour3;
  final double hour4;
  final double hour5;
  final double hour6;
  final double hour7;
  final double hour8;
  final double hour9;
  final double hour10;
  final double hour11;
  final double hour12;
  final double hour13;
  final double hour14;
  final double hour15;
  final double hour16;
  final double hour17;
  final double hour18;
  final double hour19;
  final double hour20;
  final double hour21;
  final double hour22;
  final double hour23;
  final double hour24;

  DailyChartData({
    required this.hour1,
    required this.hour2,
    required this.hour3,
    required this.hour4,
    required this.hour5,
    required this.hour6,
    required this.hour7,
    required this.hour8,
    required this.hour9,
    required this.hour10,
    required this.hour11,
    required this.hour12,
    required this.hour13,
    required this.hour14,
    required this.hour15,
    required this.hour16,
    required this.hour17,
    required this.hour18,
    required this.hour19,
    required this.hour20,
    required this.hour21,
    required this.hour22,
    required this.hour23,
    required this.hour24,
  });

}

Widget weeksText(double value , TitleMeta meta ){
  TextStyle style = CustomTextStyles.homeNavBarTextDMSans;
  Widget text;
  switch(value.toInt()){
    case 1 :
      text = Text("Sun",style: style);
      break;
    case 2 :
      text = Text("Mon",style: style);
      break;
    case 3 :
      text = Text("Tue",style: style);
      break;
    case 4 :
      text = Text("Wed",style: style);
      break;
    case 5 :
      text = Text("Thu",style: style);
      break;
    case 6 :
      text = Text("Fri",style: style);
      break;
    case 7 :
      text = Text("Sat",style: style);
      break;
    default:
      text = Text("Err",style: style,);
      break;
  }
  return SideTitleWidget(child: text,axisSide: meta.axisSide,);
}
