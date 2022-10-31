import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

class UserRepository extends IUserRepository {
  // CREATE USER IN FIRESTORE
  @override
  Future<void> createUser(user_entity.User user) async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.id);
      final userJson = user.toJson();
      await docUser.set(userJson);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<user_entity.User>> getAllUser() {
    try {
      Stream<List<user_entity.User>> list = FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((e) => user_entity.User.fromJson(e.data()))
              .toList());
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<user_entity.User?> getUserByID(String id) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc(id);
      final snapshot = await docUser.get();
      if (snapshot.exists) {
        return user_entity.User.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(user_entity.User user) async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.id);
      await docUser.update({
        'fullName': user.fullName,
        'phone': user.phone,
        'image': user.image,
        'birthday': user.birthday,
      });
    } catch (e) {
      log('USER REPOSITORY : $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc(id);
      return await docUser.delete();
    } catch (e) {
      log('USER REPOSITORY : $e');
      rethrow;
    }
  }

  @override
  Future<void> createUserByEmailPassword(SignInSignUpRequest request) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.emailOrPhone!,
        password: request.password!,
      );
      if (credential.user != null) {
        // SEND EMAIL VERYFILE
        await AuthRepository().sendEmailVerification();
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
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
  Future<user_entity.User?> getUserByPhone(String phone) async {
    try {
      var docUser = await FirebaseFirestore.instance
          .collection("users")
          .where("phone", isEqualTo: phone)
          .get();
      if (docUser.docs.isNotEmpty) {
        return user_entity.User.fromJson(docUser.docs.first.data());
      }

      return null;
    } catch (e) {
      log('USER REPOSITORY : $e');
      rethrow;
    }
  }

  @override
  Future<void> createUserByPhonePassword(SignInSignUpRequest request) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.emailOrPhone!,
        password: request.password!,
      );
      if (credential.user != null) {
        // SEND EMAIL VERYFILE
        await AuthRepository().sendEmailVerification();
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
