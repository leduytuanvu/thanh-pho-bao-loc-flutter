import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_in_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/requests/sign_up_request.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

abstract class IUserRepository {
  // CREATE USER IN FIRESTORE
  Future<BaseResponse> createUserInFirestore(user_entity.User user);

  // GET USER IN FIRESTORE BY EMAIL
  Future<BaseResponse> getUserByEmail(String email);

  // GET USER BY EMAIL AND PASSWORD
  Future<BaseResponse> getUserByEmailAndPassword(SignInRequest signInRequest);

  // SIGN UP BY EMAIL AND PASSWORD
  Future<BaseResponse> signUpByEmailPassword(SignUpRequest request);

  // Future<BaseResponse> getAllUser();
  // Future<user_entity.User?> getUserByID(String id);
  // Future<void> updateUser(user_entity.User user);
  // Future<void> deleteUser(String id);

}
