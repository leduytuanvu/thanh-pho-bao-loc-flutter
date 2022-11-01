import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

// SIGN IN STATE
enum SignInState {
  initial,
  loading,
}

class SignInController extends GetxController {
  // ATTRIBUTES
  final AuthRepository authRepository;
  final UserRepository userRepository;

  // CRONTRUCTOR
  SignInController({
    required this.authRepository,
    required this.userRepository,
  });

  // OBSERVABLES
  var signInState = SignInState.initial.obs;
  var isShowPassword = false.obs;

  // TEXT CONTROLLER
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // GO TO SIGN UP SCREEN
  void goToSignUpScreen() => Get.offAllNamed(Routers.signUpScreen);

  // SIGN IN WITH GOOGLE
  Future<void> signInGoogle() async {
    signInState(SignInState.loading);
    var baseResponse = await authRepository.signInWithGoogle();
    if (baseResponse.statusAction == StatusAction.success &&
        baseResponse.data != null) {
      Get.offAllNamed(Routers.bottomBarScreen);
    }
    showSnackBar(
      context: Get.context,
      message: baseResponse.message,
      color: baseResponse.statusAction == StatusAction.success
          ? Colors.green
          : Colors.red,
    );
    signInState(SignInState.initial);
  }

  // SIGN IN WITH EMAIL PASSWORD
  Future<void> signInByEmailPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    signInState(SignInState.loading);
    SignInRequest signInRequest = SignInRequest(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
    BaseResponse baseResponse =
        await userRepository.getUserByEmailAndPassword(signInRequest);
    if (baseResponse.statusAction == StatusAction.success &&
        baseResponse.data != null) {
      Get.offAllNamed(Routers.bottomBarScreen);
    }
    showSnackBar(
      context: Get.context,
      message: baseResponse.message,
      color: baseResponse.statusAction == StatusAction.success
          ? Colors.green
          : Colors.red,
    );
    signInState(SignInState.initial);
  }

  // SET PASSWORD VISIBLE/ INVISIBLE
  void setIsShowPassword() => isShowPassword(!isShowPassword.value);
}
