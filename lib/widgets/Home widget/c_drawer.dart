import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Homepage/HomePage/controller/homeController.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _advancedDrawerController = AdvancedDrawerController();
class CDrawer extends StatelessWidget {

  HomeController homeController = HomeController();
  double verticalVal1 = -3;
  double verticalVal2 = -2;

  String _url = "https://v-ismart.com/our-products/";
  final Uri url = Uri.parse("https://v-ismart.com/our-products/");
  // Future<void> _launchUrl() async {
  //   launchUrl(url,mode: LaunchMode.externalApplication);
  //   // if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
  //   //   throw Exception('Could not launch $_url');
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    AutoHeight au =AutoHeight(context);
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth *3,top: screenHeight * 3),
                child : appBar(context, "Mohan",false),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal1),
                onTap: () {
                  Get.toNamed(AppRoutes.homepage);
                },
                leading: Icon(Icons.home,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Home',style:CustomTextStyles.titleSmallDMSansBluegray90001,),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal1),
                onTap: () {
                  Get.toNamed(AppRoutes.allRooms);
                },
                leading: Icon(Icons.room_preferences,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Rooms',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal1),
                onTap: () {},
                leading: Icon(Icons.devices_other_outlined,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Devices',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal1),
                onTap: () {
                  Get.toNamed(AppRoutes.allRemotes,arguments: {"showBackButton":true});
                },
                leading: Icon(Icons.settings_remote,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Remotes',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal1),
                onTap: () {
                  Get.toNamed(AppRoutes.statistics);
                },
                leading: Icon(Icons.auto_graph,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Statistics',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth *3,top: screenHeight * 0.5),
                child: Divider(),
              ),
              // ListTile(
              //   onTap: () {
              //     Get.toNamed(AppRoutes.accountInfo);
              //   },
              //   leading: Icon(Icons.account_circle_rounded,color: Theme.of(context).colorScheme.tertiary),
              //   title: Text('Profile',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              // ),
              // ListTile(
              //   onTap: () {},
              //   leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.tertiary),
              //   title: Text('Setting',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              // ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal2),
                onTap: () {
                  Get.toNamed(AppRoutes.voiceControl);
                },
                leading: Icon(Icons.keyboard_voice_outlined,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Voice Control',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal2),
                onTap: (){

                },
                leading: Icon(Icons.shopping_cart_outlined,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Buy Vincense Products',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal2),
                onTap: () {
                  Get.toNamed(AppRoutes.about);
                },
                leading: Icon(Icons.info_outlined,color: Theme.of(context).colorScheme.tertiary),
                title: Text('About',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal2),
                onTap: () {},
                leading: Icon(Icons.question_mark_rounded,color: Theme.of(context).colorScheme.tertiary),
                title: Text('FAQ',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal2),
                onTap: () {
                  Get.toNamed(AppRoutes.support);
                },
                leading: Icon(Icons.support_agent,color: Theme.of(context).colorScheme.tertiary),
                title: Text('Support',style: CustomTextStyles.titleSmallDMSansBluegray90001),
              ),


              Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: verticalVal2),
                  onTap: () async{
                   // await FirebaseAuth.instance.signOut();
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setBool("isLogin", false);
                    Get.offAllNamed(AppRoutes.loginPageScreen);
                  },
                  leading: Icon(Icons.logout,color: Theme.of(context).colorScheme.tertiary),
                  title: Text('Log out',style:CustomTextStyles.titleSmallDMSansBluegray90001),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
          width: screenWidth * 6,
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

void _handleMenuButtonPressed() {
  // NOTICE: Manage Advanced Drawer state through the Controller.
  // _advancedDrawerController.value = AdvancedDrawerValue.visible();
  _advancedDrawerController.showDrawer();
}