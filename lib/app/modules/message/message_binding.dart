import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}
