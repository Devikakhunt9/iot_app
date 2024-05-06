import 'package:iot_application1/presentation/Account%20Information/account_information.dart';
import 'package:iot_application1/presentation/Authentication/forget_password_screen/bindings/forgetPassword_bindings.dart';
import 'package:iot_application1/presentation/Authentication/forget_password_screen/forget_password_page.dart';
import 'package:iot_application1/presentation/Authentication/otp/bindings/otp_bindings.dart';
import 'package:iot_application1/presentation/Authentication/otp/otp_page.dart';
import 'package:iot_application1/presentation/Authentication/signup_page_screen/singup_page_screen.dart';
import 'package:iot_application1/presentation/Devices/Air%20conditioner/air_conditioner_page.dart';
import 'package:iot_application1/presentation/Devices/speaker/speakerScreen.dart';
import 'package:iot_application1/presentation/Homepage/CreateHomePage/create_homepage.dart';
import 'package:iot_application1/presentation/Homepage/HomePage/home.dart';
import 'package:iot_application1/presentation/Homepage/dummyHome_page.dart';
import 'package:iot_application1/presentation/Remotes/AddNewRemote/add_new_remote.dart';
import 'package:iot_application1/presentation/Remotes/AllRemotes/all_remotes.dart';
import 'package:iot_application1/presentation/Rooms/all_rooms/all_rooms_page.dart';
import 'package:iot_application1/presentation/Rooms/link_device/link_devices_page.dart';
import 'package:iot_application1/presentation/Scenes/All%20Scenes/all_scenes.dart';
import 'package:iot_application1/presentation/Scenes/Create%20New%20Scene/create_new_scene.dart';
import 'package:iot_application1/presentation/Scenes/Edit%20Scene/edit_scene.dart';
import 'package:iot_application1/presentation/Scenes/Explore%20Scene/exploreScene.dart';
import 'package:iot_application1/presentation/login_page_screen/login_page_screen.dart';
import 'package:iot_application1/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:iot_application1/presentation/settings/about.dart';
import 'package:iot_application1/presentation/settings/support.dart';
import 'package:iot_application1/presentation/settings/voice_control.dart';
import 'package:iot_application1/presentation/statistics/statistics.dart';
import 'package:iot_application1/routes/device_routes.dart';
import 'package:get/get.dart';

import '../presentation/Authentication/signup_page_screen/bindings/signup_page_bindings.dart';
import '../presentation/Rooms/all_rooms/bindings/all_rooms_bindings.dart';
import '../presentation/Rooms/individual_room/IndividualRoomPage.dart';

class AppRoutes {

  static const String loginPageScreen = '/login_page_screen';

  static const String initialRoute = '/initialRoute';

  static const String signupPageScreen = '/signup_page_screen';

  static const String forgetPasswordScreen = '/forgetPassword_page_screen';

  static const String otpScreen = '/otp_page_screen';

  static const String createHome ='/create_home_screen';

  static const String homepage ='/homepage';

  static const String allRooms = '/allRooms';

  static const String individualRoom = '/individualRoom';

  static const String linkDevice = '/linkDevice';

  static const String accountInfo = '/accountInfo';

  static const String exploreScene = '/exploreScene';

  static const String allScenes = '/allScenes';

  static const String createScene = '/CreateScene';

  static const String editScene = '/editScene';

  static const String statistics = '/statistics';

  static const String allRemotes = '/allRemotes';

  static const String addNewRemote = '/addRemote';

  static const String about = '/about';

  static const String support = '/support';

  static const String voiceControl = '/voiceControl';

  static const String dummy = '/dummy';

  static List<GetPage> pages = [
    GetPage(
      name: dummy,
      page: () => DummyHomePage(),
      // bindings: [
      //   LoginPageBinding(),
      // ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    GetPage(
        name: signupPageScreen,
        page: () => SignupPageScreen(),
        bindings:[
          SignupPageBindings()
        ]
    ),
    GetPage(
        name: forgetPasswordScreen,
        page: () => ForgetPasswordPage(),
        bindings:[
          ForgetPasswordBindings()
        ]
    ),
    GetPage(
        name: otpScreen,
        page: () => OtpPage(),
        bindings:[
          OtpBindings()
        ]
    ),
    GetPage(
        name: createHome,
        page: () => CreateHomePage(),
    ),
    GetPage(
        name: homepage,
        page: () => HomePage(),
        bindings:[
          OtpBindings()
        ]
    ),
    GetPage(
        name: allRooms,
        page: () => AllRoomsPage(),
        bindings:[
          AllRoomsBindings()
        ]
    ),
    GetPage(
        name: individualRoom,
        page: () => IndividualRoomPage(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: linkDevice,
        page: () => LinkDevicePage(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: accountInfo,
        page: () => AccountInformation(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: statistics,
        page: () => StatisticsPage(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: exploreScene,
        page: () => ExploreScenes(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: allScenes,
        page: () => AllScenes(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: createScene,
        page: () => CreateNewScene(),
        // bindings:[
        //   OtpBindings()
        // ]
    ),
    GetPage(
        name: editScene,
        page: () => EditScene(),
        // bindings:[
        //   OtpBindings()
        // ]
      ),
    GetPage(
            name: allRemotes,
            page: () => AllRemotes(),
            // bindings:[
            //   OtpBindings()
            // ]
        ),
    GetPage(
            name: addNewRemote,
            page: () => AddNewRemote(),
            // bindings:[
            //   OtpBindings()
            // ]
        ),

    GetPage(
      name: about,
      page: () => About(),
      // bindings:[
      //   OtpBindings()
      // ]
    ),

    GetPage(
      name: support,
      page: () => Support(),
      // bindings:[
      //   OtpBindings()
      // ]
    ),

    GetPage(
      name: voiceControl,
      page: () => VoiceControl(),
      // bindings:[
      //   OtpBindings()
      // ]
    ),

    ///Bellow are devices that we are going to add
    GetPage(
      name: DeviceRoutes.speaker,
      page: () => SpeakerScreen(),
      // bindings:[
      //   OtpBindings()
      // ]
    ),
    GetPage(
      name: DeviceRoutes.airConditioner,
      page: () => AirConditionerPage(),
      // bindings:[
      //   OtpBindings()
      // ]
    ),
  ];
}
