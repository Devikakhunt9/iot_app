import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class VoiceControl extends StatelessWidget {
  //const VoiceControl({super.key});

  @override
  Widget build(BuildContext context) {

    AutoHeight au = AutoHeight(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                "Voice Control",
                style: CustomTextStyles.homeTitleLarge2DMSans,
              ),
             Container()
            ],
          ),
          ///Changes need to be done
          SizedBox(
            height: screenHeight * 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right:  screenWidth * 3),
            child: Container(
              width: double.maxFinite,
              height: screenHeight * 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: PrimaryColors().orangeNormal
              ),
              child: Center(child: Text("Google voice coming soon",style: CustomTextStyles.homeTitleLarge2DMSans,overflow: TextOverflow.fade,)),
            ),
          ),
          SizedBox(
            height: screenHeight * 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right:  screenWidth * 3),
            child: Container(
              width: double.maxFinite,
              height: screenHeight * 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: PrimaryColors().orangeNormal
              ),
              child: Center(child: Text("Alexa coming soon",style: CustomTextStyles.homeTitleLarge2DMSans,overflow: TextOverflow.fade,)),
            ),
          )
        ],
      ),
    );
  }
}
