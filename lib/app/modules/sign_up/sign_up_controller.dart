import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_up_by_email_password_request.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

enum SignUpState {
  initial,
  loading,
}

class SignUpController extends GetxController {
  var signUpState = SignUpState.initial.obs;
  var isShowPassword = false.obs;
  // var index = 0.obs;

  final UserRepository userRepository;
  SignUpController({required this.userRepository});

  final phoneOrEmailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final rePasswordTextController = TextEditingController();

  void goToSignInScreen() => Get.toNamed(Routers.signInScreen);

  Future<void> signUpByEmailPassword({BuildContext? context}) async {
    try {
      signUpState(SignUpState.loading);
      user_entity.User? userTmp =
          await userRepository.getUserByEmail(phoneOrEmailTextController.text);
      if (userTmp == null) {
        showSnackBar(context!, 'Ok');
      } else {
        showSnackBar(context!, 'Not ok');
      }
      // if (passwordTextController.text != rePasswordTextController.text) {
      //   showSnackBar(context!, 'Password and re-password must be the same !');
      // } else {
      //   SignInUpByEmailPasswordRequest request = SignInUpByEmailPasswordRequest(
      //     email: phoneOrEmailTextController.text,
      //     password: passwordTextController.text,
      //   );
      //   userRepository.createUserByEmailPassword(request, context!);
      //   Get.offAllNamed(Routers.homeScreen);
      //   showSnackBar(context, 'Sign up successfully !');
      // }
    } catch (e) {
      log(e.toString());
      showSnackBar(context!, e.toString());
    }
  }
}
