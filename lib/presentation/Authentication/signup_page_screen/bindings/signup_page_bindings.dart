import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/presentation/Authentication/signup_page_screen/controller/signup_controller.dart';

class SignupPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignupPageController());
  }
}