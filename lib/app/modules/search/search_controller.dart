import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/show_snack_bar.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

class SearchController extends GetxController {
  // ATTRIBUTES
  // final AuthRepository authRepository;
  final UserRepository userRepository;

  // CRONTRUCTOR
  SearchController({
    // required this.authRepository,
    required this.userRepository,
  });

  Stream<List<user_entity.User>> updateListSearch() async* {
    var response = await userRepository.getAllUser();
    if (response.statusAction == StatusAction.success &&
        response.data != null) {
      yield response.data as List<user_entity.User>;
    } else {
      showSnackBar(
        color: Colors.red.shade400,
        context: Get.context,
        message: response.message,
      );
    }
  }
}
