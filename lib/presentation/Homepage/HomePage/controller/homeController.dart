
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/data/apiClient/api_client.dart';
import 'package:iot_application1/data/models/responseModel/home_page_response_model/energy_response_model.dart';

class HomeController extends GetxController{

  RxInt navigationIndex = 0.obs;
  RxInt totalEnergy=0.obs;
    ApiClient _apiClient=ApiClient();
  getTotalEnergy(){
    EnergyResponseModel? energyResponseModel;
    totalEnergy.value=energyResponseModel!.energy as int;
    update();
  }

  void callApi() async{
    dynamic response=await _apiClient.getRelay();
    print(response);
  }


}