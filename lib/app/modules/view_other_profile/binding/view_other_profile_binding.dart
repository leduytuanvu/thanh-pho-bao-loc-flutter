import 'package:thanh_pho_bao_loc/app/core/utils/export.dart';
import 'package:thanh_pho_bao_loc/app/modules/view_other_profile/controller/view_other_profile_controller.dart';

class ViewOtherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewOtherProfileController());
  }
}
