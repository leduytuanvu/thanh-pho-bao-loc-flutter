import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/splash_controller.dart';
import '../../core/utils/export.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => SearchController(userRepository: Get.find()));
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => HomeController(authRepository: Get.find()));
  }
}
