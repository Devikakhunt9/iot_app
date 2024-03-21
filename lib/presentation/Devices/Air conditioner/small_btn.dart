import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class SmallButtons extends StatelessWidget {
  const SmallButtons(this.icon,this.name,this.onTapped);
 final IconData icon;
  final String name;
  final bool onTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth * 22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: onTapped ? Colors.orange : Theme.of(context).colorScheme.secondaryContainer,
          border:  GradientBoxBorder(
            gradient: LinearGradient(colors: [appTheme.black900,
              appTheme.orange900,]),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: screenHeight * 4,),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(name,style: CustomTextStyles.titleSmallDMSansBluegray90001,maxLines: 1,overflow: TextOverflow.ellipsis,)
            ),
          ],
        ),
      ),
    );
  }
}