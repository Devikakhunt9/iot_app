import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Scenes/Edit%20Scene/title_widget.dart';
import 'package:iot_application1/widgets/Scenes_Widgets/editSceneExpansionCard.dart';
import 'package:iot_application1/widgets/Scenes_Widgets/editSceneTitleCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditScene extends StatelessWidget {
  //const EditScene({super.key});

  List<Widget> cards =[
  EditSceneExpansionCard( deviceName : "Smart Lamp", roomName: "Living Room", imgUrl: "Url here", visibility: true),
  EditSceneExpansionCard( deviceName : "Smart Speaker", roomName: "Living Room", imgUrl: "Url here", visibility: true),
  EditSceneExpansionCard( deviceName : "Smart Light", roomName: "Living Room", imgUrl: "Url here", visibility: true),
  EditSceneExpansionCard( deviceName : "Smart Door", roomName: "Living Room", imgUrl: "Url here", visibility: true),
  ];
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    EdgeInsetsGeometry pad = EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3);
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
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Text("Edit Scene",style: CustomTextStyles.homeTitleLarge2DMSans,),
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 3),
                child:FaIcon(FontAwesomeIcons.ellipsis),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 2,
          ),

          ///Tile card
          EditSceneTitleCard(title: "30 th Anniversary", subTitle: "Wed | 11:15 AM - 01:15 PM"),

          SizedBox(
            height: screenHeight * 2,
          ),
          TitleWidget("Scenario devices", "3",true),
          SizedBox(
            height: screenHeight * 1,
          ),
          ///List view builder with expansion panel
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return cards[index];
                  }
              )
          )
        ],
      ),
    );
  }
}

