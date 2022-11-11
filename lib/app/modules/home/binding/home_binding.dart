import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/controller/create_post_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/controller/home_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/controller/message_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(authRepository: Get.find()));
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => ProfileController(authRepository: Get.find()));
    Get.lazyPut(() => CreatePostController(authRepository: Get.find()));
  }
}
