import 'package:aagash_s_application1/core/app_export.dart';
import 'create_homepage_controller.dart';

class CreateHomePageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateHomePageController());
  }
}