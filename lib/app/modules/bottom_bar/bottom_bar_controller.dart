import 'dart:developer';

import 'package:flutter/rendering.dart';

import '../../core/utils/export.dart';

class BottomBarController extends GetxController {
  var index = 0.obs;

  final ScrollController scrollController = ScrollController();
  // final ValueNotifier<bool> visible = ValueNotifier<bool>(true);
  RxBool visible = true.obs;
  RxInt indexSelect = 0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      log("MMMMMMMMMMMMMMMMMMMMMMMM");
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        visible.value = false;
        log("MMMMMMMMMMMMMMMMMMMMMMMM");
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        visible.value = true;
      }
    });
  }

  void logggg() {
    log("VUUVU");
  }

  void onChangeIndex(int index) {
    indexSelect.value = index;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
