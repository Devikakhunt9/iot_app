import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';

class RemoteSmallCard extends StatelessWidget {


  //const RemoteSmallCard({super.key});
  RemoteSmallCard({Key? key,required this.deviceName}) : super(key: key);
  final String deviceName;
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Container(
      height: screenHeight * 15,
      width: screenWidth * 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:  GradientBoxBorder(
            gradient: LinearGradient(colors: [appTheme.black900,
              appTheme.orange900,]),
            width: 2,
          ),
          color: Theme.of(context).colorScheme.secondaryContainer
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.adb_outlined,size: 50,color: Theme.of(context).colorScheme.surface,),
          SizedBox(
            height: 5,
          ),
          Center(child: Text(deviceName,style: CustomTextStyles.homeTitleSmallDMSans,maxLines: 2,overflow: TextOverflow.fade,textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}
