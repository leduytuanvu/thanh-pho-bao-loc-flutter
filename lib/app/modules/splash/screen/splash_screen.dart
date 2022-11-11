import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/controller/splash_controller.dart';
import '../../../core/utils/export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          child: Lottie.asset(
            'assets/videos/loading.json',
            height: 250.w,
            width: 250.w,
          ),
        ),
      ),
    );
  }
}
