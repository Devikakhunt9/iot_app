import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/presentation/Account%20Information/account_information.dart';
import 'package:aagash_s_application1/presentation/Homepage/HomePage/controller/homeController.dart';
import 'package:aagash_s_application1/presentation/Remotes/AllRemotes/all_remotes.dart';
import 'package:aagash_s_application1/presentation/Scenes/Explore%20Scene/exploreScene.dart';
import 'package:aagash_s_application1/widgets/Home%20widget/c_drawer.dart';
import 'package:aagash_s_application1/widgets/Home%20widget/custom_home_shortcut.dart';
import 'package:aagash_s_application1/widgets/custom_device_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../widgets/Home widget/custom_top_bar.dart';
import '../../Bar Chart/CustomBarGraph.dart';
import '../../Bar Chart/dummyChart.dart';

final _advancedDrawerController = AdvancedDrawerController();

class HomePage extends StatelessWidget {

  List<Widget> navList = [
    HomeCompo(),
    HomeCompo(),
    ExploreScenes(),
    AllRemotes(),
    AccountInformation(),
  ];
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    AutoHeight(context);
    ///Drawer Settings
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            //colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.5)],
            colors: [Theme.of(context).colorScheme.secondaryContainer,Theme.of(context).colorScheme.background]
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),

      ///Drawer
      drawer: CDrawer(),

      ///Scaffold
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        ///Body of the Home Page
        body: Obx(
            () => navList[controller.navigationIndex.value],
        ),
      
        ///Bottom navigation not completed
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
              () =>           ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: controller.navigationIndex.value,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    selectedItemColor: PrimaryColors().orangeNormal,
                    // unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
                     selectedLabelStyle: CustomTextStyles.homeNavBarTextDMSans,
                    unselectedLabelStyle: CustomTextStyles.homeNavBarTextDMSans,
                    onTap: (value) {
                      // Respond to item press.
                      //setState(() => _currentIndex = value);
                      controller.navigationIndex.value = value;
                      print(controller.navigationIndex.value);
                      print("test");
                    },
                    items: [
                      BottomNavigationBarItem(
                        //title: Text('Favorites'),
                        label: "Home",
                        icon: Icon(Icons.home_rounded),
                      ),
                      BottomNavigationBarItem(
                        //title: Text('Music'),
                        label: "Devices",
                        icon: Icon(Icons.devices_other_outlined),
                      ),
                      BottomNavigationBarItem(
                        //title: Text('Music'),
                        label: "Scenes",
                        icon: Icon(Icons.alarm_add),
                      ),
                      BottomNavigationBarItem(
                        //title: Text('Places'),
                        label: "Remote",
                        icon: Icon(Icons.settings_remote),
                      ),
                      BottomNavigationBarItem(
                        //title: Text('News'),
                        label: "Account",
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                    ],
                  )
              ),
          )
        ),
      ),
    );
  }
}

void _handleMenuButtonPressed() {
  // NOTICE: Manage Advanced Drawer state through the Controller.
  // _advancedDrawerController.value = AdvancedDrawerValue.visible();
  _advancedDrawerController.showDrawer();
}

///Appbar widget
Widget appBar(BuildContext context,String userName,bool show){
  return Container(
    height: screenHeight * 10,
    child: Row(
      children: [
        ///Avatar Image
        CircleAvatar(
          radius: screenHeight * 3,
        ),
        SizedBox(
          width: screenWidth * 3,
        ),
        ///User name
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width : screenWidth * 50,
                  child: Text("lbl_home_welcome".tr,style: CustomTextStyles.titleSmallDMSansBluegray90001,maxLines: 1,overflow: TextOverflow.ellipsis,)),
              Container(
                  width : screenWidth * 50,
                  child: Text(userName,style: CustomTextStyles.createHomeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth * 4 ,
        ),
        Visibility(
          visible: show,
          child: Row(
            children: [
              ///Icon - Search
              Icon(Icons.search,size: screenHeight * 3.5,color: Theme.of(context).colorScheme.onInverseSurface,),
              SizedBox(
                width: screenWidth * 2,
              ),
              ///Divider
              Center(
                child: Container(
                  height: screenHeight * 3.5,
                  width: screenWidth * 0.5,
                  color: appTheme.gray300,
                ),
              ),
              SizedBox(
                width: screenWidth * 2,
              ),
              ///Icon - Drawer
              //Icon(Icons.menu_outlined,size:screenHeight * 3.5,color: Theme.of(context).colorScheme.onInverseSurface,),
              IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

///Title Widget
Widget widgetTitle(BuildContext context,String title,bool showCount,String count){
  return Padding(
    padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(top:6),
            height: screenHeight * 5.5,
            width: screenWidth * 70,
            child: Row(
              children: [
                Text(title.tr,style: CustomTextStyles.homeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,),
                SizedBox(
                  width: screenWidth * 2,
                ),
                Visibility(
                  visible: showCount,
                  child: Container(
                    height: screenHeight * 4,
                    width: screenWidth * 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.orange,
                    ),
                    child: Center(child: Text(count,style: CustomTextStyles.titleSmallDMSansCount,)),
                  ),
                )
              ],
            )
        ),
        SizedBox(
          height: screenHeight * 2,
        ),
        FaIcon(FontAwesomeIcons.ellipsis,size: screenHeight * 2.5,color: Theme.of(context).colorScheme.onInverseSurface,),
      ],
    ),
  );
}

///Spend Bar widget
Widget spendBar(BuildContext context,String hours,String spend){
  return Row(
    children: [
      Container(
        height: screenHeight * 10,
        width: screenWidth * 46,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment:Alignment.topLeft,child: Text("lbl_home_total_spend".tr,style:CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
            Align(alignment:Alignment.topLeft,child: Text(spend,style:CustomTextStyles.homeTitleLarge2DMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
      Container(
        height: screenHeight * 10,
        width: screenWidth * 46,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment:Alignment.topLeft,child: Text("lbl_home_total_hours".tr,style:CustomTextStyles.homeTitleSmallDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
            Align(alignment:Alignment.topLeft,child: Text(hours,style:CustomTextStyles.homeTitleLarge2DMSans,maxLines: 1,overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    ],
  );
}

///Real Home Page - As a sperate class
class HomeCompo extends StatelessWidget {
  //const HomeCompo({super.key});
  List<CustomDeviceCard> devices = [CustomDeviceCard(deviceName: "Lamp", roomName:"Living Room",switchStatus:true,),CustomDeviceCard(deviceName:"Speaker", roomName:"Living Room",switchStatus:false),CustomDeviceCard(deviceName:"Light",roomName: "Living Room",switchStatus:true),CustomDeviceCard(deviceName:"Bulb", roomName:"Living Room",switchStatus:false)];

  ///Do change this according to api for graph data
  DummyChartData dummyData = DummyChartData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ///Top Spacing
          SizedBox(
            height: screenHeight * 3.5,
          ),
          ///Avatar with Name
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
              child: appBar(context, "Mohan",true)
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          ///Top widget
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
            child: CustomTopBar("123","10","7"),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          ///Total Usage status
          widgetTitle(context, "lbl_home_usage_status",false,"10"),
          ///Spend Bar
          SizedBox(
            height: screenHeight * 0.5,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
            child: spendBar(context, "8 h", "35.02 Kwh"),
          ),
          ///Graph
          SizedBox(
              height: screenHeight * 30,
              child: CustomBarGraph(
                data: dummyData.weeklyUse,
                yValue: 100,
              )
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          ///Scene shortcut title
          widgetTitle(context, "lbl_home_scene_shortcut",true,"8"),
          SizedBox(
            height: screenHeight * 2,
          ),
          ///Shortcuts
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3,),
              child: Row(
                children: [
                  CustomHomeShortcut("All Lights On", "Home"),
                  SizedBox(width: screenWidth * 2,),
                  CustomHomeShortcut("Play Music", "Living Room"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          ///Devices title
          widgetTitle(context, "lbl_home_your_device",true,"10"),
          SizedBox(
            height: screenHeight * 2,
          ),
          ///Device Box
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: screenHeight * 2,
            padding: EdgeInsets.only(left: screenWidth * 2,right: screenWidth * 2),
            children: List.generate(4, (index) {
              return Center(child: devices[index]);
            }),
          ),
          SizedBox(
            height: screenHeight * 5,
          ),
        ],
      ),
    );
  }
}
