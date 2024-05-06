import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/energy_response_model.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/relayResponeModel.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/status_response_model.dart';

class ApiClient extends GetConnect {
@override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://VS/1234567890AB';
  }

Future<Response<RelayResponseModel>> getRelay() =>
    get('/relay/get');
Future<Response<EnergyResponseModel>> getEnergy() =>
    get('/energy/get');
Future<Response<StatusResponseModel>> getStatus() =>
    get('/status/get');
}
