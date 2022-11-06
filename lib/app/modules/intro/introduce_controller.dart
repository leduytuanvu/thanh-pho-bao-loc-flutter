import 'dart:developer';
import '../../core/utils/export.dart';

class IntroduceController extends GetxController {
  var listTitle = [
    'Fresh ingredients for tasty, home-cooked dinners',
    'Delivery 7 days a week. Pause or skip anytime',
    'Cook perfect meals with professional tips',
    'Tasty home cooked meals, without all the fuss',
  ];
  var listImg = [
    'assets/images/background_intro_screen_1.png',
    'assets/images/background_intro_screen_2.png',
    'assets/images/background_intro_screen_3.png',
    'assets/images/background_intro_screen_4.png',
  ];
  var index = 0.obs;

  Future<void> getStarted() async {
    try {
      await Future.delayed(const Duration(seconds: 0));
      Get.offAllNamed(Routers.signInScreen);
    } catch (e) {
      log(e.toString());
    }
  }
}
