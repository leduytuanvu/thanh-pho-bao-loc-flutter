import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
