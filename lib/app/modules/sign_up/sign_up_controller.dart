import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_otp_dialog.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

enum SignUpState {
  initial,
  loading,
}

class SignUpController extends GetxController {
  var signUpState = SignUpState.initial.obs;
  var isShowPassword = false.obs;

  final UserRepository userRepository;
  final AuthRepository authRepository;
  SignUpController({
    required this.userRepository,
    required this.authRepository,
  });

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final rePasswordTextController = TextEditingController();

  void goToSignInScreen() => Get.toNamed(Routers.signInScreen);

  Future<void> signUpByEmailPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    signUpState(SignUpState.loading);
    SignUpRequest signUpRequest = SignUpRequest(
      email: emailTextController.text,
      password: passwordTextController.text,
      rePassword: rePasswordTextController.text,
    );
    BaseResponse baseResponse =
        await userRepository.signUpByEmailPassword(signUpRequest);
    if (baseResponse.statusAction == StatusAction.success &&
        baseResponse.data != null) {
      Get.offAllNamed(Routers.signInScreen);
    }
    showSnackBar(
      context: Get.context,
      message: baseResponse.message,
      color: baseResponse.statusAction == StatusAction.success
          ? Colors.green
          : Colors.red,
    );
    signUpState(SignUpState.initial);
  }
}
