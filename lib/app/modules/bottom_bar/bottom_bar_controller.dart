import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';

class BottomBarController extends GetxController {
  var index = 0.obs;

  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    log('vo ne');
  }
  // final AuthRepository authRepository;
  // BottomBarController({required this.authRepository});
  // signOut({BuildContext? context}) {
  //   try {
  //     authRepository.signOut(context: context!);
  //   } catch (e) {}
  // }
}
