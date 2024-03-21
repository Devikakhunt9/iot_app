import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';

class SceneContainer extends StatelessWidget {

  SceneContainer({required this.scenes});

  final List<Widget> scenes;

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return  Padding(
      padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth*3),
      child: Container(
        //height: screenHeight * 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15),
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: [appTheme.black900,
              appTheme.orange900,]),
            width: 2,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: scenes
          ),
        ),
      ),
    );
  }
}
