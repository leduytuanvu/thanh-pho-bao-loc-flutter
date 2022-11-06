import 'dart:convert';
import 'dart:developer';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_string_constants.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:thanh_pho_bao_loc/app/domain/responses/base_response.dart';

class LocalStorageService extends GetxService {
  static SharedPreferences? sharedPreferences;

  static Future<LocalStorageService?> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return LocalStorageService();
  }

  static clearAllData() => sharedPreferences!.clear();

  static BaseResponse getUser() {
    var response = BaseResponse(
      statusCode: null,
      message: "Get user in local fail !",
      data: null,
      statusAction: StatusAction.failure,
    );
    try {
      var userString =
          sharedPreferences!.getString(AppString.sharedReferenceUser);
      log("User string get in local >>>>> $userString");
      if (userString == null) {
        response.message == "User in local is empty !";
      } else {
        Map<String, dynamic> userMap = jsonDecode(userString);
        log("User map get in local >>>>> $userMap");
        // userMap.
        user_entity.User user = user_entity.User.fromJson(userMap, false);
        response.data = user;
        response.message = "Get user in local success !";
        response.statusAction = StatusAction.success;
      }
    } catch (e) {
      response.message = e.toString();
    }
    return response;
  }

  static BaseResponse setUser(user_entity.User user) {
    var response = BaseResponse(
      statusCode: null,
      message: "Set user in local fail !",
      data: null,
      statusAction: StatusAction.failure,
    );
    try {
      var encodeResponse = jsonEncode(user.toMap());
      log("$encodeResponse RESPONSE NE");
      sharedPreferences!.setString(
        AppString.sharedReferenceUser,
        encodeResponse,
      );

      response.message = "Set user in local success !";
      response.statusAction = StatusAction.success;
      user_entity.User tmp = LocalStorageService.getUser().data;
      log("${tmp.createdAt} SAVE LOCAL");
    } catch (e) {
      response.message = e.toString();
    }
    return response;
  }
}
