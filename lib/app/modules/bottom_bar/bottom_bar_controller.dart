import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var index = 0.obs;

  var scrollController = ScrollController().obs;
  var visible = ValueNotifier<bool>(true).obs;

  ScrollController tmp = ScrollController();

  @override
  void onInit() {
    super.onInit();

    log('vo ne');
  }

  // final AuthRepository authRepository;
  // BottomBarController({required this.authRepository});
  // signOut({BuildContext? context}) {
  //   try {
  //     authRepository.signOut(context: context!);
  //   } catch (e) {}
  // }
  HideNavbar() {
    visible.value = ValueNotifier<bool>(true);
    scrollController.addListener(
      () {
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
      },
    );
  }
}
