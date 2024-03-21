import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/widgets/Scenes_Widgets/editSceneTitleCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class EditSceneExpansionCard extends StatelessWidget {

   EditSceneExpansionCard({
    Key? key,
    required this.deviceName,
    required this.roomName,
    required this.imgUrl,
    required this.visibility,
  }) : super(key:key);


  final String deviceName;
  final String roomName;
  final String imgUrl;
  final bool visibility;

  ExpansionCardController controller = ExpansionCardController();
  @override
  Widget build(BuildContext context) {
    AutoHeight au =AutoHeight(context);
    return Obx(() =>
    Column(
      children: [
        ///Top part
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,bottom: screenHeight * 2),
          child: Container(
            width: double.maxFinite,
            height: screenHeight * 11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondaryContainer,
              border:  GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  appTheme.black900,
                  appTheme.orange900,
                ]),
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 1,right: screenWidth * 2),
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width : screenWidth * 50,
                            child: Text(deviceName,style: CustomTextStyles.titleSmallDMSansBluegray90001,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                        Container(
                            width : screenWidth * 50,
                            child: Text(roomName,style: CustomTextStyles.createHomeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                    onTap:  (){
                      print("Hello");
                      controller.changeVisibility();
                    },
                    child: Icon(Icons.arrow_drop_down)
                )
              ],
            ),
          ),
        ),
        ///Bottom Part
        Visibility(
          visible: controller.toExpand.value,
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth* 3,right: screenWidth * 3,top: screenHeight * 1,bottom: screenHeight*1),
            child: Container(
              width: double.maxFinite,
              height: screenHeight * 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondaryContainer,
                border:  GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                    appTheme.black900,
                    appTheme.orange900,
                  ]),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth* 1,right: screenWidth * 1,top: screenHeight * 1,bottom: screenHeight*1),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Set Schedule".tr,style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,maxLines: 1,),
                        ///Please write down the sate management functionality bellow by using the particular controller
                        CupertinoSwitch(
                          //inactiveTrackColor: PrimaryColors().gray500,
                          offLabelColor: PrimaryColors().gray500,
                          activeColor: PrimaryColors().orangeNormal,
                          trackColor: PrimaryColors().gray500,
                          value: false,
                          onChanged: (value){
                            print("Change");
                            //switchStatus = !switchStatus;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 2,
                    ),
                    Row(
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
                    SizedBox(height: screenHeight * 1,),
                    Row(
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
                    SizedBox(height: screenHeight * 1,)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    )
    );
  }
}

class ExpansionCardController extends GetxController{
  RxBool toExpand = false.obs;

  void changeVisibility(){
    toExpand.value = !toExpand.value;
  }
}