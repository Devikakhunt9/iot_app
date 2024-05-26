import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Remotes/AllRemotes/remote_grid.dart';
import 'package:iot_application1/widgets/Remotes%20Widgets/remote_card.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AllRemotes extends StatelessWidget {
  //const AllRemotes({super.key});

  ///Bellow lists are for reference only please use the API's to populate
  List<RemoteCard> devices1 = [
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
  ];
  List<RemoteCard> devices2 = [
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
  ];
  List<RemoteCard> devices3 = [
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
    RemoteCard(
        deviceName: "Air Conditioner",
        roomName: "Living Room",
        imgUrl: "",
        onPressed: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    Map<String, dynamic> arguments = Get.arguments ?? {"showBackButton": false};
    bool toShowBackButton = arguments["showBackButton"] ?? false;
    return DefaultTabController(
      ///Change ot dynamic length as per the api
      length: 3,

      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
          //  backgroundColor: Theme.of(context).colorScheme.background,
            // leading: Visibility(
            //   visible: toShowBackButton,
            //   child: GestureDetector(
            //     child: Icon(Icons.arrow_back),
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
            centerTitle: false,
            title: Text(
              "Remotes",
              style: CustomTextStyles.homeTitleLarge2DMSans,
            ),
            //   bottom: TabBar(
            //     indicatorSize: TabBarIndicatorSize.tab,
            //     padding: EdgeInsets.symmetric(horizontal: 12),
            //     dividerColor: Colors.transparent,

            //     indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
            //     // indicator: BoxDecoration(
            //     //   borderRadius: BorderRadius.circular(15), // Creates border
            //     //   //color: PrimaryColors().orangeNormal,
            //     //   // border: GradientBoxBorder(
            //     //   //   gradient: LinearGradient(colors: [appTheme.black900,
            //     //   //     appTheme.orange900,]),
            //     //   //   width: 1,
            //     //   // ),
            //     // ),
            //     labelStyle: GoogleFonts.plusJakartaSans(
            //         fontSize: 14, fontWeight: FontWeight.w600),
            //     //labelColor: PrimaryColors().pureWhite,
            //     ///Pass the Tab Here Dynamically as per the length into a loop
            //     tabs: [
            //       Tab(text: "All Remote"),
            //       Tab(
            //         text: "Living Room",
            //       ),
            //       Tab(
            //         text: "Kitchen",
            //       ),
            //     ],
            //   ),
            // ),
          ),

          ///Create new Remote button
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addNewRemote);
            },
            child: Icon(
              Icons.add,
              color: PrimaryColors().pureWhite,
            ),
          ),
          body: TabBarView(
            children: [
              RemoteGrid(devices1),
              RemoteGrid(devices2),
              RemoteGrid(devices3),
            ],
          )),
    );
  }
}
