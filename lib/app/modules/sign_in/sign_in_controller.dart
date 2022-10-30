import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

enum SignInState {
  initial,
  loading,
}

class SignInController extends GetxController {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignInController({
    required this.authRepository,
    required this.userRepository,
  });

  var signInState = SignInState.initial.obs;
  var isShowPassword = false.obs;

  final emailOrPhoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void goToSignUpScreen() {
    Get.offAllNamed(Routers.signUpScreen);
  }

  Future<void> signInGoogle({BuildContext? context}) async {
    try {
      signInState(SignInState.loading);
      var user = await authRepository.signInWithGoogle(context: context!);
      if (user != null) {
        var userTmp = await userRepository.getUserByID(user.uid);
        if (userTmp != null) {
          LocalStorageService.setUser = userTmp;
        } else {
          var userEntity = user_entity.User(
            id: user.uid,
            email: user.email ?? "",
            fullName: user.displayName ?? "",
            phone: user.phoneNumber ?? "",
            image: user.photoURL ?? "",
            accountStatus: "active",
            birthday: "",
            gender: "",
            lastLogin: "",
            lastSeen: "",
            passsword: "",
            status: "active",
            uid: user.uid,
            username: "",
          );
          userRepository.createUser(userEntity);
          LocalStorageService.setUser = userEntity;
        }

        Get.offAllNamed(Routers.homeScreen);
      }
      signInState(SignInState.initial);
    } catch (e) {
      log(e.toString());
      signInState(SignInState.initial);
    }
  }

  Future<void> createUser({BuildContext? context}) async {
    try {
      signInState(SignInState.loading);
      user_entity.User newUser = user_entity.User(fullName: 'asdf');
      UserRepository().createUser(newUser);

      signInState(SignInState.initial);
    } catch (e) {
      log(e.toString());
      signInState(SignInState.initial);
    }
  }

  void setIsShowPassword() {
    // isShowPassword(true);
  }
}
