import 'package:flutter/material.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/data/apiClient/api_client.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/energy_response_model.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/relayResponeModel.dart';
import 'package:iot_application1/presentation/Shared%20Prefrences/shared_prefrences.dart';

class HomeController extends GetxController {
  RxInt navigationIndex = 0.obs;
  List devices = [
    {
      "deviceName": "AC",
      "roomName": "Air Conitioner",
      "switchStatus": false,
    },
    {
      "deviceName": "Speaker",
      "roomName": "Living Room",
      "switchStatus": false,
    },
    {
      "deviceName": "Light",
      "roomName": "Living Room",
      "switchStatus": false,
    },
    {
      "deviceName": "Bulb",
      "roomName": "Living Room",
      "switchStatus": false,
    },
    // CustomDeviceCard(
    //     deviceName: "Speaker", roomName: "Living Room", switchStatus: false),
    // CustomDeviceCard(
    //     deviceName: "Light", roomName: "Living Room", switchStatus: true),
    // CustomDeviceCard(
    //     deviceName: "Bulb", roomName: "Living Room", switchStatus: false)
  ];
  List<bool> switchStatuses = [];
  List<int> deviceStatus = [0,0,0,0,0];
  int dimmer = 0;
  String msg = '';

  HomeController(){
    switchStatuses = devices.map((device) => device["switchStatus"] as bool).toList();
  }
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
    // switchStatuses[index] = devices[index]["switchStatus"];
    update();
  }
  Future<String> publishMessage(int index) async {
    int? dimmerStored = await SharedPreferencesHelper.getDimmers();
    // print(msg);
    // print('${index} :::: ${deviceStatus[index]} ::: ${deviceStatus}');
    // devices[index]["switchStatus"]
    deviceStatus[index] =devices[index]["switchStatus"]==true?1:0;
    await SharedPreferencesHelper.saveRelays(deviceStatus);
    List<int> realyStored = await SharedPreferencesHelper.getRelays();
    // print('${index} :::: ${deviceStatus}');
    String msg = '{"Switch":{"Relays":${realyStored},"Dimmers":[${dimmerStored.toString()}]}}';
    return msg;
  }
}
