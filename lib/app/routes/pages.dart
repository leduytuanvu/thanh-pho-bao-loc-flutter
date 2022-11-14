import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/binding/bottom_bar_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/screen/bottom_bar_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/binding/create_post_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/screen/create_post_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/binding/home_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/screen/home_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/binding/message_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/screen/message_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/binding/profile_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/screen/profile_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/binding/search_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/screen/search_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/binding/sign_in_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/screen/sign_in_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/binding/sign_up_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/screen/sign_up_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/binding/splash_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/screen/splash_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/view_other_profile/binding/view_other_profile_binding.dart';
import 'package:thanh_pho_bao_loc/app/modules/view_other_profile/screen/view_other_profile_screen.dart';
import '../core/utils/export.dart';

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
      name: Routers.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routers.bottomBarScreen,
      page: () => const BottomBarScreen(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: Routers.searchScreen,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routers.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routers.messageScreen,
      page: () => const MessageScreen(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: Routers.createPostScreen,
      page: () => const CreatePostScreen(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: Routers.viewOtherProfileScreen,
      page: () => ViewOtherProfileScreen(),
      binding: ViewOtherProfileBinding(),
    ),
  ];
}
