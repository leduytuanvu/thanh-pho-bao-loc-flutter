import 'package:firebase_core/firebase_core.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

abstract class IAuthRepository {
  // INITIALIZER FIREBASE
  Future<FirebaseApp> initializeFirebase();
  // SIGN IN WITH GOOGLE
  Future<BaseResponse> signInWithGoogle();
  // SIGN OUT
  Future<BaseResponse> signOut();
  // SIGN UP BY EMAIL AND PASSWORD
  Future<BaseResponse> signInWithEmailPassword({
    required SignInRequest request,
  });
  // SEND MAIL VERIFICATION
  Future<BaseResponse> sendEmailVerification();
}
