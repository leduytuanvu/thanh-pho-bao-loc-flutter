import 'dart:developer';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  Future<void> validateSession() async {
    try {
      var user = LocalStorageService.getUser();
      if (user != null) {
        Get.offAllNamed(Routers.homeScreen);
      } else {
        Get.offAllNamed(Routers.signInScreen);
      }
    } catch (e) {
      showSnackBar(context: Get.context, message: e.toString());
    }
  }
}
