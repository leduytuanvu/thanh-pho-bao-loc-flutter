import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/intro/introduce_controller.dart';

class IntroduceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroduceController());
  }
}
