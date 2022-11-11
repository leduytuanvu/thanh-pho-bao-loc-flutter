import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/controller/create_post_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/controller/home_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/controller/search_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/controller/splash_controller.dart';
import '../../../core/utils/export.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => SearchController(userRepository: Get.find()));
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => CreatePostController(authRepository: Get.find()));
    Get.lazyPut(() => HomeController(authRepository: Get.find()));
  }
}
