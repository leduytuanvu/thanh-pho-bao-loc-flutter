import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/controller/message_controller.dart';
import '../../../core/utils/export.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => BottomBarController());
  }
}
