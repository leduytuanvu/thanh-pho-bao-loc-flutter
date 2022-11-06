import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import '../../core/utils/export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  Future<void> validateSession() async {
    var response = LocalStorageService.getUser();
    if (response.statusAction == StatusAction.success) {
      Get.offAllNamed(Routers.bottomBarScreen);
    } else {
      Get.offAllNamed(Routers.signInScreen);
    }
  }
}
