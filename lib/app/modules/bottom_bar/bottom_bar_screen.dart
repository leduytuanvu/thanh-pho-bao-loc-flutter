import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_screen.dart';

class BottomBarScreen extends GetWidget<BottomBarController> {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final HideNavbar hiding = HideNavbar();
    Future<void> loadMore() async {
      // controller.loadMore(true);
      await Future.delayed(const Duration(seconds: 2));
      // controller.loadMore(false);
    }

    var listScreen = [
      const HomeScreen(),
      const SearchScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: RefreshIndicator(
        displacement: 100.h,
        onRefresh: () => loadMore(),
        child: CustomScrollView(
          // controller: hiding.controller,
          controller: controller.scrollController,
          slivers: <Widget>[
            // SliverPersistentHeader(
            //   delegate:C ,
            //   pinned: false,
            //   floating: true,
            //   // delegate: HomeHearderWidget(),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // return Column(
                  //   children: [
                  //     listScreen[controller.index.value],
                  //   ],
                  // );
                  return Obx(() => SizedBox(
                        child: listScreen[controller.index.value],
                      ));
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: controller.visible,
        builder: (context, bool value, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: value ? kBottomNavigationBarHeight : 0.0,
          child: Wrap(
            children: <Widget>[
              Obx(() => BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.blue,
                    fixedColor: Colors.white,
                    unselectedItemColor: Colors.white,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                          color: controller.index.value == 0
                              ? Colors.red
                              : Colors.black,
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                          color: controller.index.value == 1
                              ? Colors.red
                              : Colors.black,
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                          color: controller.index.value == 2
                              ? Colors.red
                              : Colors.black,
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                          color: controller.index.value == 3
                              ? Colors.red
                              : Colors.black,
                        ),
                        label: "Home",
                      ),
                    ],
                    currentIndex: controller.index.value,
                    onTap: (index) {
                      controller.index(index);
                      log(index.toString() + " INDEX NE");
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
