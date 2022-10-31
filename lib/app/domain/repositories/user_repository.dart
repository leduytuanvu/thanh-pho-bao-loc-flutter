import 'package:flutter/widgets.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

abstract class IUserRepository {
  Future<void> createUser(user_entity.User user);
  Stream<List<user_entity.User>> getAllUser();
  Future<user_entity.User?> getUserByID(String id);

  // GET USER IN FIRESTORE BY EMAIL
  Future<BaseResponse> getUserByEmail(String email);
  Future<user_entity.User?> getUserByPhone(String phone);
  Future<void> updateUser(user_entity.User user);
  Future<void> deleteUser(String id);
  Future<void> createUserByEmailPassword(SignInSignUpRequest request);
  Future<void> createUserByPhonePassword(SignInSignUpRequest request);
}
