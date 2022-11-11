import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/components/icon_bottom_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/screen/home_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/screen/message_screen.dart';
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
      const ProfileScreen(),
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
                  log('bottom');
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
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                bottom: controller.isVisible.value ? 0.0 : -56.h,
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 6.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0.r),
                    ),
                    height: 50.0.h,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
