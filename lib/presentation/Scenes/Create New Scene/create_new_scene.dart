import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class CreateNewScene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      backgroundColor : Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 5,
          ),
          ///Top app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 3),
                child: GestureDetector(
                  child: Icon(Icons.arrow_back),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Text("Create Scene",style: CustomTextStyles.homeTitleLarge2DMSans,),
              // Padding(
              //   padding: EdgeInsets.only(right: screenWidth * 3),
              //   child:FaIcon(FontAwesomeIcons.ellipsis),
              // )
              Container()
            ],
          ),
          ///Top scheduling button
          SizedBox(
            height: screenHeight * 2,
          ),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
              child: Text("Schedule".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Text("How often do you want it to be?".tr,style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.fade,),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
              child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  ///Just dummy - Please customize it as per the functionality - I don't know the usability for the bellow widgets
                  children: [
                    customChips(context,"Everyday"),
                    SizedBox(width: screenWidth * 1,),
                    customChips(context,"Week Day"),
                    SizedBox(width: screenWidth * 1,),
                    customChips(context,"Custom Date"),
                  ],
                ),
              )
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Divider(color: Colors.grey,)
          ),
          SizedBox(
            height: screenHeight * 1,
          ),


          ///Calendar scheduling
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Text("Schedule".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Text("Select the desired dates".tr,style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.fade,),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: GestureDetector(
              onTap: (){
                // SfDateRangePicker(
                //
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Select the dates".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
                  GestureDetector(
                    ///Please write down the sate management functionality bellow by using the particular controller
                    onTap: ()=>showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    ),
                    child: Container(
                      width: screenWidth * 25,
                      height: screenHeight * 5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(10),
                        border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            appTheme.black900,
                            appTheme.orange900,
                          ]),
                          width: 2,
                        ),
                      ),
                      child: Center(child: Text("Date here",style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.fade,),),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
              child: Divider(color: Colors.grey,)
          ),

          ///Time scheduling
          SizedBox(
            height: screenHeight * 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Text("Working time".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Text("Select the desired time interval".tr,style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.fade,),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          ///On time
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Time ON".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
                GestureDetector(
                  ///Please write down the sate management functionality bellow by using the particular controller
                  onTap: ()=>showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ),
                  child: Container(
                    width: screenWidth * 25,
                    height: screenHeight * 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          appTheme.black900,
                          appTheme.orange900,
                        ]),
                        width: 2,
                      ),
                    ),
                    child: Center(child: Text("Time here",style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.fade,),),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          ///Off time
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Time OFF".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
                GestureDetector(
                  ///Please write down the sate management functionality bellow by using the particular controller
                  onTap: ()=>showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ),
                  child: Container(
                    width: screenWidth * 25,
                    height: screenHeight * 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          appTheme.black900,
                          appTheme.orange900,
                        ]),
                        width: 2,
                      ),
                    ),
                    child: Center(child: Text("Time here",style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.fade,),),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


Widget customChips(BuildContext context,String name){
  return Container(
    height: screenHeight*6,
    width: screenWidth*30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.secondaryContainer,
    ),
    child: Center(
      child: Text(
        name,
        style: CustomTextStyles.createHomeTitleLargeDMSans,
      ),
    ),
  );
}