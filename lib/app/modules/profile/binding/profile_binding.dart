import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
import '../../../core/utils/export.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(authRepository: Get.find()));
    Get.lazyPut(() => BottomBarController());
  }
}
