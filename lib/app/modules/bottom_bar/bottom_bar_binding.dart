import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
  }
}
