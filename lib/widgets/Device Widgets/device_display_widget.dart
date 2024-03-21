import 'package:flutter/material.dart';

import '../../core/utils/size_utils.dart';

class DeviceDisplayWidget extends StatelessWidget {

  DeviceDisplayWidget({required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    AutoHeight au =AutoHeight(context);
    Color outer = Theme.of(context).colorScheme.secondaryContainer;
    Color inner = Theme.of(context).colorScheme.background;
    return Container(
      height: screenHeight * 40,
      width: screenWidth * 100,
      child: Stack(
        children: [
          circles(outer, 80, 80),
          circles(inner, 78, 78),
          circles(outer, 68, 68),
          circles(inner, 66, 66),
          circles(outer, 55, 55),
          circles(inner, 53, 53),
          circles(outer, 44, 44),
          circles(inner, 42, 42),
          ///Image Here
          Center(
            child: Container(
              width: screenWidth * 90,
              height: screenHeight * 30,
              child: Center(child: Image.asset(image)),
            ),
          ),
        ],
      ),
    );
  }
}
Widget circles(Color color,double height,double width){
  return Center(
    child: Container(
      height: screenHeight * height,
      width: screenWidth * width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        //borderRadius: BorderRadius.circular(100)
      ),
    ),
  );
}