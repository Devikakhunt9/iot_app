import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Scenes/All%20Scenes/all_screens_list.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class AllScenes extends StatelessWidget {
  //const AllScenes({super.key});

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    Map<String,dynamic> arguments = Get.arguments?? {"showBackButton":false};
    bool toShowBackButton = arguments["showBackButton"];
    return DefaultTabController(
      ///Change the length dynamically for the length
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: Visibility(
            visible: toShowBackButton,
            child: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          centerTitle: toShowBackButton ? false : true,
          title: Text("All Scene",style: CustomTextStyles.homeTitleLarge2DMSans,),
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
            ///Pass the Tab Here Dynamically as per the length into a loop
            tabs: [
              Tab(text: "All Scenes"),
              Tab(text: "Living Room",),
              Tab(text: "Kitchen",),
            ],
          ),
        ),
        ///Create new scene button
        floatingActionButton: FloatingActionButton(
            onPressed: (){
                Get.toNamed(AppRoutes.createScene);
            },
          child: Icon(Icons.add,color: PrimaryColors().pureWhite,),
        ),
        body: TabBarView(
          children: [
            AllScreensList("Evening", "Everyday | 08:15 AM - 9:00 AM",3),
            AllScreensList("Evening", "Everyday | 08:15 AM - 9:00 AM",4),
            AllScreensList("Evening", "Everyday | 08:15 AM - 9:00 AM",5),
          ],
        ),
      ),
    );
  }
}

// Widget allScenesView(String title,String subTitle,int listLength){
//   return  ListView.builder(
//       itemCount: listLength,
//       itemBuilder: (context,index){
//         return Padding(
//           padding:EdgeInsets.only(top: screenHeight * 2),
//           child: AllScenesCard(title: title, subTitle: subTitle),
//         );
//       }
//   );
// }
