import 'package:thanh_pho_bao_loc/app/components/bottom_bar_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/bottom_bar_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_screen.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_screen.dart';
import '../../core/utils/export.dart';

class BottomBarScreen extends GetWidget<BottomBarController> {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      const ProfileScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          displacement: 10.h,
          onRefresh: () => loadMore(),
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: <Widget>[
              // SliverAppBar(
              //   elevation: 0,
              //   backgroundColor: Colors.white,
              //   toolbarHeight: 50.h,
              //   collapsedHeight: 56.h,
              //   // expandedHeight: 30.h,
              //   pinned: false,
              //   floating: true,
              //   flexibleSpace: Padding(
              //     padding: EdgeInsets.only(
              //         right: 10.w, left: 10.w, top: 15.h, bottom: 5.h),
              //     child: Container(
              //       // height: 45.w,
              //       decoration: BoxDecoration(
              //         color: Colors.grey.shade200,
              //         borderRadius: BorderRadius.circular(100.0.r),
              //       ),
              //       alignment: Alignment.center,
              //       child: Padding(
              //         padding: EdgeInsets.only(
              //           right: 6.w,
              //           left: 6.w,
              //         ),
              //         child: Row(
              //           children: [
              //             SizedBox(width: 4.w),
              //             Icon(
              //               Icons.search,
              //               color: Colors.black26,
              //               size: 20.sp,
              //             ),
              //             SizedBox(width: 8.w),
              //             Expanded(
              //               child: Text(
              //                 'Search by name, email, phone number ...',
              //                 style: TextStyle(
              //                   fontFamily: GoogleFonts.montserrat().fontFamily,
              //                   color: Colors.black26,
              //                   fontSize: 15.sp,
              //                 ),
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
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
            height: value ? kBottomNavigationBarHeight.h : 0.0,
            child: Wrap(
              children: const [
                BottomBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
