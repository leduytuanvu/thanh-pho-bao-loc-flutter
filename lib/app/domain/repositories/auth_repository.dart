import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_up_by_email_password_request.dart';

abstract class IAuthRepository {
  Future<FirebaseApp> initializeFirebase();
  Future<User?> signInWithGoogle({required BuildContext context});
  Future<void> signOut({required BuildContext context});
  Future<void> signInWithEmailPassword({
    required SignInUpByEmailPasswordRequest request,
  });
  Future<void> sendEmailVerification({required BuildContext context});
}
