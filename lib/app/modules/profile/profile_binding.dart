import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
