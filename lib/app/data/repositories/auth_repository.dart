import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';
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
      message: 'SIGN IN WITH GOOGLE FAILED !',
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

        if (userFirebase?.emailVerified == false) {
          baseResponse.message = 'PLEASE VERIFY YOUR EMAIL !';
        } else {
          if (userFirebase != null) {
            // CREATE USER ENTITY
            var userEntity = user_entity.User.fromFirebase(userFirebase);
            BaseResponse baseResponseGetUserByEmail =
                await UserRepository().getUserByEmail(userFirebase.email!);
            if (baseResponseGetUserByEmail.statusAction ==
                StatusAction.failure) {
              // CREATE USER IN FIRESTORE

              BaseResponse baseResponseCreateUser =
                  await UserRepository().createUserInFirestore(userEntity);
              if (baseResponseCreateUser.statusAction == StatusAction.success &&
                  baseResponseCreateUser.data != null) {
                // SAVE USER TO LOCAL STORAGE
                LocalStorageService.setUser = userEntity;
                // SET RESULT
                baseResponse.data = userEntity;
                baseResponse.statusAction = StatusAction.success;
                baseResponse.message = 'SIGN IN SUCCESS !';
              } else {
                baseResponse.message =
                    baseResponseCreateUser.message.toString().toUpperCase();
              }
            } else {
              // SAVE USER TO LOCAL STORAGE
              LocalStorageService.setUser = userEntity;
              // SET RESULT
              baseResponse.data = userEntity;
              baseResponse.statusAction = StatusAction.success;
              baseResponse.message = 'SIGN IN SUCCESS !';
            }
          }
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
  Future<BaseResponse> signOut() async {
    var baseResponse = BaseResponse(
      data: null,
      statusCode: null,
      statusAction: StatusAction.failure,
      message: 'SIGN OUT FAILED !',
    );
    try {
      await FirebaseAuth.instance.signOut();
      LocalStorageService.clearAllData();
      baseResponse.statusAction = StatusAction.success;
      baseResponse.message = 'SIGN OUT SUCCESS !';
    } catch (e) {
      baseResponse.message = e.toString().toUpperCase();
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> signInWithEmailPassword({
    required SignInRequest request,
  }) async {
    var baseResponse = BaseResponse(
      data: null,
      statusCode: null,
      statusAction: StatusAction.failure,
      message: 'SIGN IN FAILURE',
    );
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
      baseResponse.data = credential.user;
      baseResponse.statusAction = StatusAction.success;
      baseResponse.message = 'SIGN IN SUCCESS';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        baseResponse.message = e.message.toString().toUpperCase();
      } else if (e.code == 'wrong-password') {
        baseResponse.message = e.message.toString().toUpperCase();
      } else {
        baseResponse.message = e.message.toString().toUpperCase();
      }
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> sendEmailVerification() async {
    var baseResponse = BaseResponse(
      data: null,
      statusCode: null,
      statusAction: StatusAction.failure,
      message: 'SEND EMAIL VERIFICATION FAILURE',
    );
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      baseResponse.statusAction = StatusAction.success;
      baseResponse.data = user;
      baseResponse.message = 'SEND EMAIL VERIFICATION SUCCESS';
    } catch (e) {
      baseResponse.message = e.toString().toUpperCase();
    }
    return baseResponse;
  }
}
