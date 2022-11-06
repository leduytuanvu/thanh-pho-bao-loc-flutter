import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import '../../core/utils/export.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(userRepository: Get.find()));
    Get.lazyPut(() => UserRepository());
  }
}
