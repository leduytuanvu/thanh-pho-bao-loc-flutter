import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';

class HomeController extends GetxController {
  final AuthRepository authRepository;
  HomeController({required this.authRepository});
  signOut({BuildContext? context}) {
    try {
      authRepository.signOut(context: context!);
    } catch (e) {}
  }
}
