import 'dart:convert';
import 'package:get/get.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/relayResponeModel.dart';

class RelayController extends GetxController {
  Rx<RelayResponseModel> _relayResponse = RelayResponseModel(
    switches: Switches(dimmers: [0], relays: [0, 0, 0, 0, 0]),
  ).obs;

  RelayResponseModel get relayResponse => _relayResponse.value;

  void updateRelayResponse(RelayResponseModel newRelayResponse) {
    _relayResponse.value = newRelayResponse;
  }

  void updateRelay(int index, int value) {
    _relayResponse.update((val) {
      val!.switches.relays[index] = value;
    });
  }

  void updateDimmer(int value) {
    _relayResponse.update((val) {
      val!.switches.dimmers[0] = value;
    });
  }

  String constructMessageAndPublish(int index) {
    List<int> relaysArray = List<int>.from(_relayResponse.value.switches.relays);
    relaysArray[index] = relaysArray[index] == 0 ? 1 : 0;

    String message = '{"Switch":{"Relays":$relaysArray,"Dimmers":[${_relayResponse.value.switches.dimmers[0]}]}}';
    print("Publishing message: $message");

    // Call your publish method here
    // mqttService.publish('${mqttService.id}relay/get', message);

    return message;
  }

  void processIncomingMessage(String message) {
    try {
      final decodedMessage = json.decode(message);
      List<int> relays = List<int>.from(decodedMessage['Switch']['Relays']);
      List<int> dimmers = List<int>.from(decodedMessage['Switch']['Dimmers']);

      _relayResponse.value = RelayResponseModel(
        switches: Switches(dimmers: dimmers, relays: relays),
      );
    } catch (e) {
      print("Error processing incoming message: $e");
    }
  }
}
