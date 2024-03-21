import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'dart:math' as math;
class CustomHomeShortcut extends StatelessWidget {
  CustomHomeShortcut(
      this.name,
      this.roomName
      );

  final String name;
  final String roomName;
  @override
  Widget build(BuildContext context) {
    AutoHeight au =AutoHeight(context);
    return Container(
      height: screenHeight * 9,
      width: screenWidth * 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth*2,
          ),
          Container(
            height: screenHeight * 7,
            width: screenWidth * 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Center(
              child: Icon(Icons.lightbulb,size: screenHeight * 4,color: Colors.yellow,),
            ),
          ),
          SizedBox(
            width: screenWidth*2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: CustomTextStyles.createHomeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: screenHeight * 0.2,),
              Text(roomName,style:  CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,),
            ],
          ),
        ],
      ),
    );
  }
}
