import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/services/local_storage_service.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

class UserRepository extends IUserRepository {
  // CREATE USER IN FIRESTORE
  @override
  Future<BaseResponse> createUserInFirestore(user_entity.User user) async {
    BaseResponse baseResponse = BaseResponse(
      data: null,
      statusCode: null,
      statusAction: StatusAction.failure,
      message: 'CREATE USER IN FIRESTORE FAILURE',
    );
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.id);
      final userJson = user.toJson();
      await docUser.set(userJson);
      baseResponse.data = user;
      baseResponse.statusAction = StatusAction.success;
      baseResponse.message = 'CREATE USER IN FIRESTORE SUCCESS';
    } catch (e) {
      baseResponse.message = e.toString();
    }
    return baseResponse;
  }

  // @override
  // Future<BaseResponse> getAllUser() async {
  //   var response = BaseResponse(
  //     statusCode: null,
  //     message: "GET ALL USER FAILURE",
  //     data: null,
  //     statusAction: StatusAction.failure,
  //   );
  //   try {
  //     // Stream<List<user_entity.User>> list = FirebaseFirestore.instance
  //     //     .collection('users')
  //     //     .snapshots()
  //     //     .map((snapshot) => snapshot.docs
  //     //         .map((e) => user_entity.User.fromJson(e.data()))
  //     //         .toList());
  //     // Stream<List<user_entity.User>> list = FirebaseFirestore.instance
  //     //     .collection('users')
  //     //     .snapshots()
  //     //     .transform(Utils.transformer(user_entity.User.fromJson));
  //     response.data =
  //         FirebaseFirestore.instance.collection("users").snapshots();
  //     response.statusAction = StatusAction.success;
  //     response.message = "GET ALL USER SUCCESS";
  //   } catch (e) {
  //     response.message = e.toString().toUpperCase();
  //   }
  //   return response;
  // }

  // @override
  // Future<user_entity.User?> getUserByID(String id) async {
  //   try {
  //     final docUser = FirebaseFirestore.instance.collection('users').doc(id);
  //     final snapshot = await docUser.get();
  //     if (snapshot.exists) {
  //       return user_entity.User.fromJson(snapshot.data()!);
  //     }
  //     return null;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> updateUser(user_entity.User user) async {
  //   try {
  //     final docUser =
  //         FirebaseFirestore.instance.collection('users').doc(user.id);
  //     await docUser.update({
  //       'fullName': user.fullName,
  //       'phone': user.phone,
  //       'image': user.image,
  //       'birthday': user.birthday,
  //     });
  //   } catch (e) {
  //     log('USER REPOSITORY : $e');
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> deleteUser(String id) async {
  //   try {
  //     final docUser = FirebaseFirestore.instance.collection('users').doc(id);
  //     return await docUser.delete();
  //   } catch (e) {
  //     log('USER REPOSITORY : $e');
  //     rethrow;
  //   }
  // }

  @override
  Future<BaseResponse> signUpByEmailPassword(SignUpRequest request) async {
    BaseResponse baseResponse = BaseResponse(
      data: null,
      message: 'SIGN UP BY EMAIL AND PASSWORD FAILED',
      statusAction: StatusAction.failure,
      statusCode: null,
    );
    try {
      BaseResponse responseGetUserByEmail =
          await getUserByEmail(request.email!);
      if (responseGetUserByEmail.data != null &&
          responseGetUserByEmail.statusAction == StatusAction.success) {
        baseResponse.message = 'EMAIL ALREADY EXISTS';
      } else {
        if (request.password != request.rePassword) {
          baseResponse.message = 'PASSWORD AND RE-PASSWORD NOT MATCH';
        } else {
          // CREATE USER BY EMAIL AND PASSWORD
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: request.email!,
            password: request.password!,
          );
          if (credential.user != null) {
            // SEND EMAIL VERIFICATION
            var responseSendEmail =
                await AuthRepository().sendEmailVerification();
            if (responseSendEmail.statusAction == StatusAction.success &&
                responseSendEmail.data != null) {
              // SIGN IN USER BY EMAIL AND PASSWORD
              SignInRequest signInRequest = SignInRequest(
                email: request.email,
                password: request.password,
              );
              var userFirebase = await AuthRepository().signInWithEmailPassword(
                request: signInRequest,
              );
              // CREATE USER IN FIREBASE FIRESTORE
              final userEntity =
                  user_entity.User.fromFirebase(userFirebase.data);
              userEntity.password = request.password;
              BaseResponse responseCreateUserInFireBase =
                  await createUserInFirestore(userEntity);
              if (responseCreateUserInFireBase.statusAction ==
                      StatusAction.success &&
                  responseCreateUserInFireBase.data != null) {
                LocalStorageService.setUser = userEntity;
                baseResponse.data = userEntity;
                baseResponse.statusAction = StatusAction.success;
                baseResponse.message =
                    'SIGN UP BY EMAIL AND PASSWORD SUCCESS, PLEASE VERIFY EMAIL';
              } else {
                baseResponse.message =
                    responseCreateUserInFireBase.message.toString();
              }
            } else {
              baseResponse.message = responseSendEmail.message.toString();
            }
          } else {
            baseResponse.message = 'CREATE USER BY EMAIL AND PASSWORD FAILED';
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        baseResponse.message = 'THE PASSWORD PROVIDED IS TOO WEAK';
      } else if (e.code == 'email-already-in-use') {
        baseResponse.message = 'THE ACCOUNT ALREADY EXISTS FOR THAT EMAIL';
      } else {
        baseResponse.message = e.message;
        log(e.message.toString());
      }
    } catch (e) {
      baseResponse.message = e.toString();
    }
    return baseResponse;
  }

// GET USER BY EMAIL
  @override
  Future<BaseResponse> getUserByEmail(String email) async {
    BaseResponse baseResponse = BaseResponse(
      data: null,
      message: 'GET USER BY EMAIL FAILURE',
      statusAction: StatusAction.failure,
      statusCode: null,
    );
    try {
      var docUser = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: email)
          .get();
      if (docUser.docs.isNotEmpty) {
        baseResponse.data = user_entity.User.fromJson(
          docUser.docs.first.data(),
        );
        baseResponse.message = "GET USER BY EMAIL SUCCESS";
        baseResponse.statusAction = StatusAction.success;
      }
    } catch (e) {
      baseResponse.message = e.toString();
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> getUserByEmailAndPassword(
    SignInRequest signInRequest,
  ) async {
    BaseResponse baseResponse = BaseResponse(
      data: null,
      message: 'GET USER BY EMAIL AND PASSWORD FAILURE',
      statusAction: StatusAction.failure,
      statusCode: null,
    );
    try {
      var baseResponseSignIn = await AuthRepository().signInWithEmailPassword(
        request: signInRequest,
      );
      if (baseResponseSignIn.data != null &&
          baseResponseSignIn.statusAction == StatusAction.success) {
        var user = baseResponseSignIn.data as User;
        if (user.emailVerified == false) {
          baseResponse.message = 'PLEASE VERIFY YOUR EMAIL !';
        } else {
          var docUser = await FirebaseFirestore.instance
              .collection("users")
              .where("email", isEqualTo: signInRequest.email)
              .where("password", isEqualTo: signInRequest.password)
              .get();
          if (docUser.docs.isNotEmpty) {
            baseResponse.data = user_entity.User.fromJson(
              docUser.docs.first.data(),
            );
            baseResponse.message = "SIGN IN SUCCESS !";
            baseResponse.statusAction = StatusAction.success;
          }
        }
      } else {
        baseResponse.message =
            baseResponseSignIn.message.toString().toUpperCase();
      }
    } catch (e) {
      baseResponse.message = e.toString().toUpperCase();
    }
    return baseResponse;
  }
}
