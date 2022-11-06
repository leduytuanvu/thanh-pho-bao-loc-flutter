import 'package:thanh_pho_bao_loc/app/modules/intro/introduce_controller.dart';
import '../../core/utils/export.dart';

class IntroduceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroduceController());
  }
}
