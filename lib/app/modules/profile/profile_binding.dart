import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';
import '../../core/utils/export.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
