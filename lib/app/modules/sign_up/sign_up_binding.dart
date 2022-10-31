import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(
          userRepository: Get.find(),
          authRepository: Get.find(),
        ));
    Get.lazyPut(() => AuthRepository());
  }
}
