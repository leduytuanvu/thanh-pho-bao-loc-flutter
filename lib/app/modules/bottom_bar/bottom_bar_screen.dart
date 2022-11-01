import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';
import 'package:thanh_pho_bao_loc/app/components/bottom_bar_component.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_screen.dart';

class BottomBarScreen extends GetWidget<BottomBarController> {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HideNavbar hiding = HideNavbar();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: CustomScrollView(
        controller: hiding.controller,
        slivers: <Widget>[
          HomeScreen()
          // const SliverAppBar(
          //   pinned: true,
          //   expandedHeight: 250.0,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('Demo'),
          //   ),
          //   floating: true,
          // ),
          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200.0,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 4.0,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.teal[100 * (index % 9)],
          //         child: Text('Grid Item $index'),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),

          // SliverFixedExtentList(
          //   itemExtent: 50,
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       log('index: $index');
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.lightBlue[100 * (index % 9)],
          //         child: Text('List Item $index'),
          //       );
          //     },
          //   ),
          // ),
        ],
        // child: Stack(
        //   children: [
        //     Obx(() => IndexedStack(
        //           index: controller.index.value,
        //           children: const [
        //             HomeScreen(),
        //             SearchScreen(),
        //             MessageScreen(),
        //             // PostScreen(),
        //             // HistoryScreen(),
        //             ProfileScreen(),
        //           ],
        //         )),
        //     const BottomBarWidget(),
        //   ],
        // ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: hiding.visible,
        builder: (context, bool value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: value ? kBottomNavigationBarHeight : 0.0,
          child: Wrap(
            children: <Widget>[
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.blue,
                fixedColor: Colors.white,
                unselectedItemColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Home"),
                ],
                currentIndex: controller.index.value,
                onTap: (index) {
                  controller.index.value = index;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HideNavbar {
  final ScrollController controller = ScrollController();
  final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  HideNavbar() {
    visible.value = true;
    controller.addListener(
      () {
        if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (visible.value) {
            visible.value = false;
          }
        }

        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!visible.value) {
            visible.value = true;
          }
        }
      },
    );
  }

  void dispose() {
    controller.dispose();
    visible.dispose();
  }
}
