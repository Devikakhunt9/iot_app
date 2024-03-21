import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/widgets/Scenes_Widgets/explore_scene_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExploreScenes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AutoHeight au =AutoHeight(context);
    late Map<String,dynamic> arguments = Get.arguments ?? {"showBackButton":false};
    bool toShowBackButton = arguments["showBackButton"];
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
              Visibility(
                visible: toShowBackButton,
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 3),
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Text("Explore",style: CustomTextStyles.homeTitleLarge2DMSans,),
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 3),
                child: FaIcon(FontAwesomeIcons.ellipsis),
              )
            ],
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          ///Connect the api here to generate a proper tiles of scene data
          Expanded(
              child: ListView
                  .builder(
                itemCount: 10,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 1),
                      child: ExploreSceneCard(title: "Title", subTitle: "This is test sentence to text the words"),
                    );
                  },
              )
          )
        ],
      ),
    );
  }
}
