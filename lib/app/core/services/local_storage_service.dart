import 'dart:convert';
import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_string_constants.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

class LocalStorageService extends GetxService {
  static SharedPreferences? _sharedPreferences;

  static Future<LocalStorageService?> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return LocalStorageService();
  }

  static clearAllData() => _sharedPreferences!.clear();

  // static String? get getToken {
  //   try {
  //     String? token = _sharedPreferences!.getString(
  //       AppConstants.sharedReferenceToken,
  //     );
  //     if (token == '') return null;
  //     return token;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  static user_entity.User? getUser() {
    try {
      Map<String, dynamic> userMap = jsonDecode(
        _sharedPreferences!.getString(AppStringConstants.sharedReferenceUser)!,
      );
      user_entity.User user = user_entity.User.fromJson(userMap);
      return user;
    } catch (e) {
      return null;
    }
  }

  // static set setToken(String token) {
  //   try {
  //     _sharedPreferences!.setString(AppConstants.sharedReferenceToken, token);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  static set setUser(user_entity.User user) {
    try {
      var response = jsonEncode(user);
      log('asdf');
      log('asdf');
      log('asdf');
      _sharedPreferences!.setString(
        AppStringConstants.sharedReferenceUser,
        response,
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
