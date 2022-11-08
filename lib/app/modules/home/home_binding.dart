import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(authRepository: Get.find()));
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => ProfileController(authRepository: Get.find()));
  }
}
