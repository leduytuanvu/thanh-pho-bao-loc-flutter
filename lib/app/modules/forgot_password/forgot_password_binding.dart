import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
