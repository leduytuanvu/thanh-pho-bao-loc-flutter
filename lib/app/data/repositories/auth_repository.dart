import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/domain/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_up_by_email_password_request.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';

class AuthRepository extends IAuthRepository {
  @override
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Future<User?> signInWithGoogle({required BuildContext context}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        Get.snackbar('ERROR', e.toString());
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('ERROR', e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar('ERROR', e.toString());
      return null;
    }
    return null;
  }

  @override
  Future<void> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      LocalStorageService.clearAllData();
      Get.offAllNamed(Routers.signInScreen);
    } catch (e) {
      Get.snackbar('ERROR', e.toString());
    }
  }

  @override
  Future<void> signInWithEmailPassword(
      {required SignInUpByEmailPasswordRequest request}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> sendEmailVerification({required BuildContext context}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent');
    } catch (e) {
      log(e.toString());
    }
  }
}
