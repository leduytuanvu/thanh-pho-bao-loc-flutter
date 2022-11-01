import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_screen.dart';

class BottomBarScreen extends GetWidget<BottomBarController> {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final HideNavbar hiding = HideNavbar();
    loadMore() async {
      // controller.loadMore(true);
      await Future.delayed(const Duration(seconds: 2));
      // controller.loadMore(false);
    }

    //   bottomNavigationBar: ValueListenableBuilder(
    //     valueListenable: hiding.visible,
    //     builder: (context, bool value, child) => AnimatedContainer(
    //       duration: const Duration(milliseconds: 500),
    //       height: value ? kBottomNavigationBarHeight : 0.0,
    //       child: Wrap(
    //         children: <Widget>[
    //           BottomNavigationBar(
    //             type: BottomNavigationBarType.fixed,
    //             backgroundColor: Colors.blue,
    //             fixedColor: Colors.white,
    //             unselectedItemColor: Colors.white,
    //             items: const [
    //               BottomNavigationBarItem(
    //                   icon: Icon(Icons.search), label: "Home"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(Icons.search), label: "Home"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(Icons.search), label: "Home"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(Icons.search), label: "Home"),
    //             ],
    //             currentIndex: controller.index.value,
    //             onTap: (index) {
    //               controller.index.value = index;
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: RefreshIndicator(
        displacement: 169,
        onRefresh: () => loadMore(),
        child: CustomScrollView(
          controller: controller.scrollController.value,
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
                  return Column(
                    children: [
                      HomeScreen(),
                      Container(
                        height: 500,
                        color: Colors.red,
                      ),
                      Container(
                        height: 500,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 500,
                        color: Colors.red,
                      ),
                      Container(
                        height: 500,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 500,
                        color: Colors.red,
                      ),
                      Container(
                        height: 500,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 500,
                        color: Colors.red,
                      ),
                      // const HomeADSCarouselSliderWidget(),
                      const SizedBox(height: 4),
                      // const HomeListFilterWidget(),
                      const SizedBox(height: 6),
                      // const HomeListProductWidget(),
                      // Obx(() {
                      //   if (controller.loadMore.value) {
                      //     return const CircularProgressIndicator(
                      //       color: Colors.black,
                      //       // value: 20,
                      //     );
                      //   } else {
                      //     return const SizedBox.shrink();
                      //   }
                      // }),
                      const SizedBox(height: 100),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: controller.visible.value,
        builder: (context, bool value, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
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

// class HideNavbar {
//   final ScrollController controller = ScrollController();
//   final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

//   HideNavbar() {
//     visible.value = true;
//     controller.addListener(
//       () {
//         if (controller.position.userScrollDirection ==
//             ScrollDirection.reverse) {
//           if (visible.value) {
//             visible.value = false;
//           }
//         }

//         if (controller.position.userScrollDirection ==
//             ScrollDirection.forward) {
//           if (!visible.value) {
//             visible.value = true;
//           }
//         }
//       },
//     );
//   }

//   void dispose() {
//     controller.dispose();
//     visible.dispose();
//   }
// }
