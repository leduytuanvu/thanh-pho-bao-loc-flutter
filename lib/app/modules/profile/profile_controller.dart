import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/post_profile_body_component.dart';

import '../../core/utils/export.dart';

class ProfileController extends GetxController {
  final AuthRepository authRepository;
  ProfileController({required this.authRepository});
  var intdexTabBar = 0.obs;
  var num = 0.0.obs;
  var title = "Post".obs;
  final scrollController = ScrollController();

  final PageController pageController = PageController();

  List<Widget> listTabBar = [
    const PostProfileBodyComponent(),
    const Text("Saved"),
    const Text("Tagged"),
  ].obs;

  // SIGN OUT
  Future<void> signOut({BuildContext? context}) async {
    var baseResponse = await authRepository.signOut();
    await LocalStorageService.clearAllData();
    if (baseResponse.statusAction == StatusAction.success) {
      Get.offAllNamed(Routers.signInScreen);
    } else {
      showSnackBar(
        context: context,
        message: baseResponse.message,
        color: Colors.red,
      );
    }
  }
}
