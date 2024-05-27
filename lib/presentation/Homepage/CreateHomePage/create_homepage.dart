import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Homepage/CreateHomePage/create_homepage_controller.dart';

import 'package:flutter/material.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_floating_text_field.dart';
import '../../../widgets/custom_glassmorph.dart';

class CreateHomePage extends StatelessWidget {
//  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey _formKey =  GlobalKey();
  Widget signOutButton() {
    return CustomElevatedButton(
      text: "Sign Out",
      onPressed: () async {
       // await auth.signOut();
        Get.toNamed(AppRoutes.loginPageScreen);
      },
    );
  }
  CreateHomePageController controller = CreateHomePageController();
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        //backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///Top Space
              Container(
                //color: Colors.red,
                height: screenHeight * 7,
                width: double.maxFinite,
              ),
              ///Full Container
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 7,right: screenWidth*7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ///Top  AppBar
                    Row(
                      children: [
                        //Icon(Icons.arrow_back),
                        SizedBox(width: screenWidth*2,),
                        Text("create_home_appbar_ttl".tr,style: CustomTextStyles.homeTitleLarge2DMSans)
                      ],
                    ),
                    SizedBox(
                      height: screenHeight*1.5,
                    ),
                    ///Image Container
                    Container(
                      height: screenHeight * 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        //color: Colors.red,
                        boxShadow: [
                          BoxShadow(color: Colors.black, spreadRadius: 2),
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset("assets/images/home.jpeg",fit: BoxFit.cover,)),
                    ),
                    SizedBox(
                      height: screenHeight*5,
                    ),
                    ///GlassMorphic Box
                    GlassMorphism(
                      start: 0.3,
                      end: 0.3,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: screenHeight*44,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenHeight*2,
                                  ),
                                  ///Name box
                                  Text(
                                    "create_home_your_name".tr,
                                    style: CustomTextStyles.createHomeTitleLargeDMSans,
                                  ),

                                  SizedBox(
                                    height: screenHeight*2,
                                  ),
                                  CustomFloatingTextField(
                                    context: context,
                                    controller: controller.homeNameController,
                                    labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                                    labelText: "lbl_create_home_your_name".tr,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null) {
                                        return "err_create_home".tr;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight*2,
                                  ),
                                  ///House name box
                                  Text(
                                    "create_home_house_name".tr,
                                    style: CustomTextStyles.createHomeTitleLargeDMSans,
                                  ),
                                  SizedBox(
                                    height: screenHeight*2,
                                  ),
                                  CustomFloatingTextField(
                                    context: context,
                                    controller: controller.homeNameController,
                                    labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                                    labelText: "lbl_create_home_house_name".tr,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null) {
                                        return "err_create_home".tr;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight*2,
                                  ),
                                  ///Custom Button Box
                                  Text(
                                    "create_home_try_one".tr,
                                    style: CustomTextStyles.createHomeTitleLargeDMSans,
                                  ),
                                  SizedBox(
                                    height: screenHeight*3,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        customChips(context,"lbl_create_home_home".tr),
                                        SizedBox(width: screenWidth*1.5,),
                                        customChips(context,"lbl_create_home_office".tr),
                                        SizedBox(width: screenWidth*1.5,),
                                        customChips(context,"lbl_create_home_flat".tr),
                                        SizedBox(width: screenWidth*1.5,),
                                        customChips(context,"lbl_create_home_flat".tr)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 5,
                    ),
                    ///Button
                    CustomElevatedButton(
                        text:"Continue",
                        onPressed:(){
                          ///Validation Logic
                          Get.toNamed(AppRoutes.homepage);
                        },
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

Widget customChips(BuildContext context,String name){
  return Container(
    height: screenHeight*6,
    width: screenWidth*25,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.secondaryContainer,
    ),
    child: Center(
      child: Text(
        name,
        style: CustomTextStyles.createHomeTitleLargeDMSans,
      ),
    ),
  );
}