import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// This class defines the variables used in the [login_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LoginPageModel {
  RxBool isLoading = false.obs;
  RxBool isErrorState = false.obs;
  RxBool isSuccessState = false.obs;
}
