import 'package:iot_application1/core/app_export.dart';
import '../controller/all_rooms_controller.dart';

class AllRoomsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AllRoomsController());
  }
}