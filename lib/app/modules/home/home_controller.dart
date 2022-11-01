import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';

class HomeController extends GetxController {
  final AuthRepository authRepository;
  HomeController({required this.authRepository});

  // SIGN OUT
  Future<void> signOut({BuildContext? context}) async {
    var baseResponse = await authRepository.signOut();
    if (baseResponse.statusAction == StatusAction.success) {
      Get.offAllNamed(Routers.signInScreen);
    } else {
      showSnackBar(
        context: context,
        message: baseResponse.message,
        color: Colors.red,
      );
    }
  }
}
