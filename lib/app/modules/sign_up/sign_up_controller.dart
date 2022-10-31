import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_otp_dialog.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_sign_up_request.dart';
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
  final AuthRepository authRepository;
  SignUpController({
    required this.userRepository,
    required this.authRepository,
  });

  final phoneOrEmailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final rePasswordTextController = TextEditingController();
  final codeTextController = TextEditingController();

  void goToSignInScreen() => Get.toNamed(Routers.signInScreen);

  Future<void> signUpByEmailPassword({BuildContext? context}) async {
    try {
      // signUpState(SignUpState.loading);
      // user_entity.User? userTmp =
      //     await userRepository.getUserByEmail(phoneOrEmailTextController.text);

      // if (userTmp == null) {
      //   if (passwordTextController.text != rePasswordTextController.text) {
      //     showSnackBar(
      //       context: Get.context,
      //       message: 'Password and re-password must be the same !',
      //     );
      //   } else {
      //     SignInSignUpRequest request = SignInSignUpRequest(
      //       emailOrPhone: phoneOrEmailTextController.text,
      //       password: passwordTextController.text,
      //     );

      //     // Create user by email and password
      //     await userRepository.createUserByEmailPassword(request);
      //     // Sign in user by email and password
      //     var userFirebase =
      //         await authRepository.signInWithEmailPassword(request: request);
      //     // // Create user in firebase firestore
      //     // var userEntity = user_entity.User(
      //     //   id: userFirebase!.uid,
      //     //   email: userFirebase.email ?? "",
      //     //   fullName: userFirebase.displayName ?? "",
      //     //   phone: userFirebase.phoneNumber ?? "",
      //     //   image: userFirebase.photoURL ?? "",
      //     //   accountStatus: "active",
      //     //   birthday: "",
      //     //   gender: "",
      //     //   lastLogin: "",
      //     //   lastSeen: "",
      //     //   passsword: "",
      //     //   status: "active",
      //     //   uid: userFirebase.uid,
      //     //   username: "",
      //     // );
      //     // userRepository.createUser(userEntity);
      //     // LocalStorageService.setUser = userEntity;
      //     Get.offAllNamed(Routers.homeScreen);
      //   }
      // } else {
      //   showSnackBar(
      //     context: Get.context,
      //     message: 'This email is already in use !',
      //   );
      // }
    } catch (e) {
      log(e.toString());
      showSnackBar(context: Get.context, message: e.toString());
    }
  }

  Future<void> signUpByPhonePassword({BuildContext? context}) async {
    try {
      signUpState(SignUpState.loading);
      // user_entity.User? userTmp =
      //     await userRepository.getUserByEmail(phoneOrEmailTextController.text);

      // if (userTmp == null) {
      if (passwordTextController.text != rePasswordTextController.text) {
        showSnackBar(
          context: Get.context,
          message: 'Password and re-password must be the same !',
        );
      } else {
        SignInSignUpRequest request = SignInSignUpRequest(
          emailOrPhone: phoneOrEmailTextController.text,
          password: passwordTextController.text,
        );
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneOrEmailTextController.text,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // ANDROID ONLY!
            // Sign the user in (or link) with the auto-generated credential
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            showSnackBar(context: Get.context, message: e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            showOTPDialog(
                context: context!,
                textEditingController: codeTextController,
                onPressed: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeTextController.text.trim(),
                  );
                  log(codeTextController.text.toString());
                  await FirebaseAuth.instance.signInWithCredential(credential);
                  // Get.back();
                  Navigator.of(context).pop();
                });
          }),
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        // Create user by email and password
        // await userRepository.createUserByEmailPassword(request, context!);
        // Sign in user by email and password
        // var userFirebase =
        //     await authRepository.signInWithEmailPassword(request: request);
        // Create user in firebase firestore
        // var userEntity = user_entity.User(
        //   id: userFirebase!.uid,
        //   email: userFirebase.email ?? "",
        //   fullName: userFirebase.displayName ?? "",
        //   phone: userFirebase.phoneNumber ?? "",
        //   image: userFirebase.photoURL ?? "",
        //   accountStatus: "active",
        //   birthday: "",
        //   gender: "",
        //   lastLogin: "",
        //   lastSeen: "",
        //   passsword: "",
        //   status: "active",
        //   uid: userFirebase.uid,
        //   username: "",
        // );
        // userRepository.createUser(userEntity);
        // LocalStorageService.setUser = userEntity;
        // Get.offAllNamed(Routers.homeScreen);
      }
      // } else {
      //   showSnackBar(context!, 'This email is already in use !');
      // }
    } catch (e) {
      log(e.toString());
      showSnackBar(context: Get.context, message: e.toString());
    }
  }
}
