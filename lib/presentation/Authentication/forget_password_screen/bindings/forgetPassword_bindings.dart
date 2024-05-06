import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Authentication/forget_password_screen/controller/forget_password_controller.dart';

class ForgetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}