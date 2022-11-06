import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import '../../core/utils/export.dart';

class HomeController extends GetxController {
  final AuthRepository authRepository;
  HomeController({required this.authRepository});

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
