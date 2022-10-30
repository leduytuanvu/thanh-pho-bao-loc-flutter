import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_up_by_email_password_request.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';

enum SignUpState {
  initial,
  loading,
}

class SignUpController extends GetxController {
  var signUpState = SignUpState.initial.obs;
  var isShowPassword = false.obs;
  var index = 0.obs;

  final UserRepository userRepository;
  SignUpController({required this.userRepository});

  final phoneOrEmailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final rePasswordTextController = TextEditingController();

  Future<void> validateSession() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      // Get.offAllNamed(Routers.introSecondScreen);
    } catch (e) {
      log(e.toString());
    }
  }

  goToForgotPasswordScreen() {
    Get.toNamed(Routers.forgotPasswordScreen);
  }

  goToSignInScreen() {
    Get.toNamed(Routers.signInScreen);
  }

  Future<void> signUpByEmailPassword({BuildContext? context}) async {
    try {
      signUpState(SignUpState.loading);
      if (passwordTextController.text != rePasswordTextController.text) {
        log('SAI');
      } else {
        SignInUpByEmailPasswordRequest request = SignInUpByEmailPasswordRequest(
          email: phoneOrEmailTextController.text,
          password: passwordTextController.text,
        );
        userRepository.createUserByEmailAndPassword(request, context!);
        Get.offAllNamed(Routers.homeScreen);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
