import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

class AuthRepository extends IAuthRepository {
  @override
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Future<BaseResponse> signInWithGoogle() async {
    BaseResponse baseResponse = BaseResponse(
      data: null,
      statusCode: null,
      statusAction: StatusAction.failure,
      message: 'SIGN IN WITH GOOGLE FAILURE',
    );
    try {
      // SIGN IN GOOGLE
      FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount;
      googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication;
        googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential;
        userCredential = await auth.signInWithCredential(credential);

        final User? userFirebase = userCredential.user;

        if (userFirebase != null) {
          // CREATE USER ENTITY
          var userEntity = user_entity.User(
            id: userFirebase.uid,
            email: userFirebase.email ?? "",
            fullName: userFirebase.displayName ?? "",
            phone: userFirebase.phoneNumber ?? "",
            image: userFirebase.photoURL ??
                "https://www.freeiconspng.com/thumbs/account-icon/account-icon-8.png",
            statusAccount: StatusAccount.active,
            birthday: "",
            gender: Gender.empty,
            lastLogin: "",
            lastSeen: "",
            passsword: userFirebase.uid,
            status: Status.empty,
            uid: userFirebase.uid,
            username: userFirebase.uid,
          );
          BaseResponse baseResponseGetUserByEmail =
              await UserRepository().getUserByEmail(userFirebase.email!);
          if (baseResponseGetUserByEmail.statusAction == StatusAction.failure) {
            // CREATE USER IN FIRESTORE
            UserRepository().createUser(userEntity);
          }
          // SAVE USER TO LOCAL STORAGE
          LocalStorageService.setUser = userEntity;

          // SET RESULT
          baseResponse.data = userEntity;
          baseResponse.statusAction = StatusAction.success;
          baseResponse.message = 'SIGN IN WITH GOOGLE SUCCESS';
        }
      }
    } on FirebaseAuthException catch (e) {
      baseResponse.message = e.message!.toUpperCase();
    } catch (e) {
      baseResponse.message = e.toString().toUpperCase();
    }
    return baseResponse;
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      LocalStorageService.clearAllData();
      Get.offAllNamed(Routers.signInScreen);
    } catch (e) {
      Get.snackbar('ERROR', e.toString());
    }
  }

  @override
  Future<User?> signInWithEmailPassword({
    required SignInSignUpRequest request,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.emailOrPhone!,
        password: request.password!,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
      return null;
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      showSnackBar(context: Get.context, message: "Email verification sent");
    } catch (e) {
      log(e.toString());
    }
  }
}
