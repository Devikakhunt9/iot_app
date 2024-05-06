import 'package:iot_application1/core/app_export.dart';

/// This class defines the variables used in the [signup_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SignupModel {
  RxBool isSuccessState = false.obs;
  RxBool isErrorState = false.obs;
  RxBool isLoadingState = false.obs;
}