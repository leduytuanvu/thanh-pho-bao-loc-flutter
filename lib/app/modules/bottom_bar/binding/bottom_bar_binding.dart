import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/controller/message_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
import '../../../core/utils/export.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => ProfileController(authRepository: Get.find()));
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => MessageController());
  }
}
