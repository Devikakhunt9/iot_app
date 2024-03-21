import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  //const About({super.key});

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
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
                "About",
                style: CustomTextStyles.homeTitleLarge2DMSans,
              ),
              Container()
            ],
          ),

          ///Support Content
          SizedBox(
            height: screenHeight * 3,
          ),

        ],
      ),
    );
  }
}
