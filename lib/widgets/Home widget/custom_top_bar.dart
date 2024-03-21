import 'dart:ui';

import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';
import '../custom_glassmorph.dart';

class CustomTopBar extends StatelessWidget {
  CustomTopBar(
      this.unreachable,
      this.turnedOn,
      this.turnedOff,
      );

  final String unreachable;
  final String turnedOn;
  final String turnedOff;
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Container(
      height: screenHeight * 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.background,
        border:  GradientBoxBorder(
          gradient: LinearGradient(colors: [appTheme.black900,
            appTheme.orange900,]),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ///Weather Icon
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.surfaceTint.withOpacity(0.3),
                      Theme.of(context).colorScheme.surfaceTint.withOpacity(0.4),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:SizedBox(
                  height: screenHeight * 11,
                  width:  screenWidth * 22,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: Center(child: Image.asset("assets/images/weather.png")),
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 1),
          ///Unreachable
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Title
              Text("lbl_unreachable".tr,style: CustomTextStyles
                  .homeTitleSmallDMSans,),
              SizedBox(height: screenHeight * 1,),
              ///Count
              Center(child: Text(unreachable,style:  CustomTextStyles.homeTitleLarge2DMSans,)),
            ],
          ),
          //SizedBox(width: screenWidth * 2.5),
          ///Turned on
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Title
              Text("lbl_turnedOn".tr,style: CustomTextStyles
                  .homeTitleSmallDMSans,),
              SizedBox(height: screenHeight * 1,),
              ///Count
              Center(child: Text(turnedOn,style:  CustomTextStyles.homeTitleLarge2DMSans,)),
            ],
          ),
          //SizedBox(width: screenWidth * 2.5),
          ///Turned off
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Title
              Text("lbl_turnedOff".tr,style: CustomTextStyles
                  .homeTitleSmallDMSans,),
              SizedBox(height: screenHeight * 1,),
              ///Count
              Center(child: Text(turnedOff,style:  CustomTextStyles.homeTitleLarge2DMSans,)),
            ],
          ),
          //SizedBox(width: screenWidth * 1),
        ],
      ),
    );
  }
}
