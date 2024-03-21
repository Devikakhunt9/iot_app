import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/presentation/Authentication/otp/controller/otp_controller.dart';

class OtpBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => OtpController());
  }
}