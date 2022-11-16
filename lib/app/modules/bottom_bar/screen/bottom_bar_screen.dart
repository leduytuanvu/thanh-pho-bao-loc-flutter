import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/components/icon_bottom_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/screen/home_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/screen/message_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/notify/screen/notify_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/screen/profile_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/screen/search_screen.dart';
import '../../../core/utils/export.dart';

class BottomBarScreen extends GetWidget<BottomBarController> {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listScreen = [
      const HomeScreen(),
      const SearchScreen(),
      const MessageScreen(),
      const NotifyScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            NotificationListener<UserScrollNotification>(
              onNotification: (scrollController) {
                if (scrollController.metrics.pixels ==
                    scrollController.metrics.maxScrollExtent) {
                } else {
                  log('${scrollController.metrics.pixels}');
                  log('${scrollController.metrics.maxScrollExtent}');
                }
                if (scrollController.direction == ScrollDirection.reverse) {
                  controller.isVisible.value = false;
                }
                if (scrollController.direction == ScrollDirection.forward) {
                  controller.isVisible.value = true;
                }
                return true;
              },
              child: Obx(
                () => IndexedStack(
                  index: controller.indexSelect.value,
                  children: listScreen,
                ),
              ),
            ),
            Positioned(
              // duration: const Duration(milliseconds: 200),
              // bottom: controller.isVisible.value ? 0.0 : -56.h,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: 55.0.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        IconBottomComponent(
                          index: 0,
                          icon: 'house_solid.svg',
                          lable: 'Home',
                        ),
                        IconBottomComponent(
                          index: 1,
                          icon: 'search_solid.svg',
                          lable: 'Search',
                        ),
                        IconBottomComponent(
                          index: 2,
                          icon: 'star_solid.svg',
                          lable: 'Message',
                        ),
                        IconBottomComponent(
                          index: 3,
                          icon: 'cart_shopping_solid.svg',
                          lable: 'Home',
                        ),
                        IconBottomComponent(
                          index: 4,
                          icon: 'user_solid.svg',
                          lable: 'Profile',
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return Get.find<ProfileController>()
                                .updateProfileState
                                .value ==
                            UpdateProfileState.loading
                        ? Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                              ),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          )
                        : const SizedBox.shrink();
                  }),
                  Obx(() {
                    return Get.find<ProfileController>().signOutState.value ==
                            SignOutState.loading
                        ? Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.9),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          )
                        : const SizedBox.shrink();
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
