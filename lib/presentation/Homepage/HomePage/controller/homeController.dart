import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/data/apiClient/api_client.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/energy_response_model.dart';

class HomeController extends GetxController {
  RxInt navigationIndex = 0.obs;
  List devices = [
    {
      "deviceName": "AC",
      "roomName": "Air Conitioner",
      "switchStatus": true,
    },
    {
      "deviceName": "Speaker",
      "roomName": "Living Room",
      "switchStatus": false,
    },
    {
      "deviceName": "Light",
      "roomName": "Living Room",
      "switchStatus": true,
    },
    {
      "deviceName": "Bulb",
      "roomName": "Living Room",
      "switchStatus": true,
    },
    // CustomDeviceCard(
    //     deviceName: "Speaker", roomName: "Living Room", switchStatus: false),
    // CustomDeviceCard(
    //     deviceName: "Light", roomName: "Living Room", switchStatus: true),
    // CustomDeviceCard(
    //     deviceName: "Bulb", roomName: "Living Room", switchStatus: false)
  ];
  RxInt totalEnergy = 0.obs;
  ApiClient _apiClient = ApiClient();
  getTotalEnergy() {
    EnergyResponseModel? energyResponseModel;
    totalEnergy.value = energyResponseModel!.energy as int;
    update();
  }

  void callApi() async {
    dynamic response = await _apiClient.getRelay();
    print(response);
  }

  changeSwtich(index) {
    devices[index]["switchStatus"] = !devices[index]["switchStatus"];
    update();
  }
}
