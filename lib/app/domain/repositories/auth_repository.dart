import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

abstract class IAuthRepository {
  Future<FirebaseApp> initializeFirebase();
  // SIGN IN WITH GOOGLE
  Future<BaseResponse> signInWithGoogle();
  // SIGN OUT
  Future<void> signOut();
  Future<void> signInWithEmailPassword({required SignInSignUpRequest request});
  Future<void> sendEmailVerification();
}
