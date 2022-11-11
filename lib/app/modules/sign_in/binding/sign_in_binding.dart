import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/controller/home_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/controller/search_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/controller/sign_up_controller.dart';

import '../../../core/utils/export.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController(
          authRepository: Get.find(),
          userRepository: Get.find(),
        ));

    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => SignUpController(
        userRepository: Get.find(), authRepository: Get.find()));
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => HomeController(authRepository: Get.find()));
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => SearchController(userRepository: Get.find()));
  }
}
