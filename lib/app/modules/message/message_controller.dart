import 'dart:developer';

import '../../core/utils/export.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

class MessageController extends GetxController {
  var user = user_entity.User().obs;

  @override
  void onInit() {
    log("init");
    user(LocalStorageService.getUser().data);
    super.onInit();
  }

  @override
  void onReady() {
    log("ready");
    user(LocalStorageService.getUser().data);
    super.onReady();
  }
}
