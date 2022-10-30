import 'package:flutter/widgets.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_up_by_email_password_request.dart';

abstract class IUserRepository {
  Future<void> createUser(user_entity.User user);
  Stream<List<user_entity.User>> getAllUser();
  Future<user_entity.User?> getUserByID(String id);
  Future<void> updateUser(user_entity.User user);
  Future<void> deleteUser(String id);
  Future<void> createUserByEmailAndPassword(
    SignInUpByEmailPasswordRequest request,
    BuildContext context,
  );
}
