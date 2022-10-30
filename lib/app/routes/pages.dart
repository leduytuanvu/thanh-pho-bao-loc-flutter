import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/forgot_password/forgot_password_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/sign_in_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/sign_in_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/sign_up_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/sign_up_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/splash_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/splash_screen.dart';
import 'package:thanh_pho_bao_loc/app/routes/routers.dart';

class Pages {
  static final allPage = [
    GetPage(
      name: Routers.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routers.signInScreen,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routers.signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routers.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routers.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
