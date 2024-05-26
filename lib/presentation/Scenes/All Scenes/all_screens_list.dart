import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../widgets/Scenes_Widgets/all_scenes_card.dart';

class AllScreensList extends StatelessWidget {
  const AllScreensList(this.title, this.subTitle, this.listLength);
  final String title;
  final String subTitle;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: listLength,
        itemBuilder: (context,index){
          return Padding(
            padding:EdgeInsets.only(top: 16),
            child: AllScenesCard(title: title, subTitle: subTitle),
          );
        }
    );
  }
}
