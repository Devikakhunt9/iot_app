import 'package:iot_application1/firebase_options.dart';
import 'package:iot_application1/routes/device_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_export.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ///For login and signup verification
  SharedPreferences pref = await SharedPreferences.getInstance();
  if(!pref.containsKey("isLogin")){
    pref.setBool("isLogin", false);
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late SharedPreferences pref;
  Future<void> getPref() async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
      getPref();
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'Iot-Test-V1',
        initialBinding: InitialBindings(),
         //initialRoute: pref.getBool('isLogin') == true ?AppRoutes.homepage : AppRoutes.loginPageScreen,
        // initialRoute: DeviceRoutes.airConditioner,
        initialRoute: AppRoutes.homepage,
        getPages: AppRoutes.pages,
      );
    }
    );
  }
}
