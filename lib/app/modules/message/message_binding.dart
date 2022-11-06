import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';
import '../../core/utils/export.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}
