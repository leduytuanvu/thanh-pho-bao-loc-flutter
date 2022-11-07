import 'package:flutter/rendering.dart';

import '../../core/utils/export.dart';

class BottomBarController extends GetxController {
  var index = 0.obs;

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        visible.value = false;
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        visible.value = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    visible.dispose();
  }
}
