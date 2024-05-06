import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../Bar Chart/CustomBarGraph.dart';
import '../Bar Chart/dummyChart.dart';

class StatisticsPage extends StatelessWidget {
  ///Change this dummy data according to the api call
  DummyChartData dummyData = DummyChartData();

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back),
            onTap: (){
                Navigator.pop(context);
            },
          ),
          title: Text("Electricity Usage",style: CustomTextStyles.homeTitleLarge2DMSans,),
          // actions: [
          //   FaIcon(FontAwesomeIcons.ellipsis,size: screenHeight * 2.5,color: Theme.of(context).colorScheme.onInverseSurface,),
          //   SizedBox(width: screenWidth * 2,)
          // ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Creates border
                color: PrimaryColors().orangeNormal,
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [appTheme.black900,
                  appTheme.orange900,]),
                width: 2,
              ),
            ),
            labelColor: PrimaryColors().pureWhite,
            tabs: [
              Tab(text: "Today",),
              Tab(text: "Week",),
              Tab(text: "Month",),
              Tab(text: "Today",),
            ],
          ),
        ),
        body: TabBarView(
          ///Add it dynamically according to the needs
          ///Change the bar chart inputs based on the tab event
          ///Check the bar chart folders for better understanding
          ///You need to pass the daily, monthly, and yearly data from api that's it
          children: [
           tabPages(context, dummyData.weeklyUse, "8 h", "35.02 Kwh"),
           tabPages(context, dummyData.weeklyUse, "8 h", "35.02 Kwh"),
           tabPages(context, dummyData.weeklyUse, "8 h", "35.02 Kwh"),
           tabPages(context, dummyData.weeklyUse, "8 h", "35.02 Kwh"),
          ],
        ),
      ),
    );
  }
}

Widget spendBar(BuildContext context,String hours,String spend){
  return Row(
    children: [
      Container(
        height: screenHeight * 10,
        width: screenWidth * 46,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment:Alignment.topLeft,child: Text("lbl_home_total_spend".tr,style:CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
            Align(alignment:Alignment.topLeft,child: Text(spend,style:CustomTextStyles.homeTitleLarge2DMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
      Container(
        height: screenHeight * 10,
        width: screenWidth * 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment:Alignment.topLeft,child: Text("lbl_home_total_hours".tr,style:CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
            Align(alignment:Alignment.topLeft,child: Text(hours,style:CustomTextStyles.homeTitleLarge2DMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
      Container(
        width: screenWidth * 7,
        height: screenHeight * 5,
        child: Icon(Icons.settings),
      )
    ],
  );
}

Widget tabPages(BuildContext context,List<dynamic> data,String totalHours,String totalSpend){
  return Column(
    children: [
      SizedBox(
        height: screenHeight * 3,
      ),
      ///Spend Bar - just pass the values to display it
      Padding(
        padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
        child: spendBar(context, totalHours, totalSpend),
      ),
      SizedBox(
        height: screenHeight * 5,
      ),
      ///Bellow you need to configure the bar chart
      Padding(
        padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
        child: SizedBox(
            height: screenHeight * 40,
            child: CustomBarGraph(
              data: data,
              yValue: 100,
            )
        ),
      )
    ],
  );
}
