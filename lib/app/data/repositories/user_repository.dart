import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_up_by_email_password_request.dart';

class UserRepository extends IUserRepository {
  @override
  Future<void> createUser(user_entity.User user) async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.id);
      final userJson = user.toJson();
      await docUser.set(userJson);
    } catch (e) {
      log('USER REPOSITORY : $e');
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
      log('USER REPOSITORY : $e');
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
      log('USER REPOSITORY : $e');
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
  Future<void> createUserByEmailAndPassword(
      SignInUpByEmailPasswordRequest request, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
      await AuthRepository().sendEmailVerification(context: context);
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
