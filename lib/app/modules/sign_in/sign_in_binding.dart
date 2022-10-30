import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/forgot_password/forgot_password_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/sign_in_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/sign_up_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController(
          authRepository: Get.find(),
          userRepository: Get.find(),
        ));
    Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(() => SignUpController(userRepository: Get.find()));
    Get.lazyPut(() => UserRepository());
  }
}
