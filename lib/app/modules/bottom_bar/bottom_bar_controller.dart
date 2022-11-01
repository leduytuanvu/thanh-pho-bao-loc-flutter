import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var index = 0.obs;

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (visible.value) {
          visible.value = false;
        }
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!visible.value) {
          visible.value = true;
        }
      }
    });
  }

  // final AuthRepository authRepository;
  // BottomBarController({required this.authRepository});
  // signOut({BuildContext? context}) {
  //   try {
  //     authRepository.signOut(context: context!);
  //   } catch (e) {}
  // }
}
