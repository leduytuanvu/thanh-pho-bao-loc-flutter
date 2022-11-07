import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_header_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';
import '../../core/utils/export.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeaderComponent(),
          // const ProfileBodyComponent(),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              'Le Duy Tuan Vu',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 18.sp,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0.5, 0.5),
                    blurRadius: 1,
                  ),
                ],
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              'leduytuanvu.work@gmail.com',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 26.h),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 7.w),
          //   child: DefaultTabController(
          //     length: 3, // length of tabs
          //     initialIndex: 0,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: <Widget>[
          //         Container(
          //           child: Theme(
          //             data: ThemeData(
          //               highlightColor: Colors.transparent,
          //               splashColor: Colors.transparent,
          //             ),
          //             child: TabBar(
          //               labelColor: Colors.black,
          //               unselectedLabelColor: Colors.black,
          //               indicator: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(
          //                   100.0.r,
          //                 ),
          //                 color: Colors.grey.shade300,
          //               ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              // color: Colors.red,
              height: 40.h,
              child: Obx(
                () {
                  final size = MediaQuery.of(context).size;
                  final withScreen = size.width - 10 - 10;
                  var tmp = withScreen / 3;
                  controller.num(tmp);
                  return Stack(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (() {
                              if (controller.intdexTabBar.value != 0) {
                                controller.intdexTabBar(0);
                                controller.title("Post");
                              }
                            }),
                            child: Container(
                              width: tmp - 6,
                              // duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              // width: 100.w,

                              child: const Text('Post'),
                            ),
                          ),
                          const SizedBox(width: 9),
                          GestureDetector(
                            onTap: (() {
                              if (controller.intdexTabBar.value != 1) {
                                controller.intdexTabBar(1);
                                controller.title("Friends");
                              }
                            }),
                            child: Container(
                              width: tmp - 6,
                              // duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              // width: 100.w,

                              child: const Text('Friends'),
                            ),
                          ),
                          const SizedBox(width: 9),
                          GestureDetector(
                            onTap: (() {
                              if (controller.intdexTabBar.value != 2) {
                                controller.intdexTabBar(2);
                                controller.title("Profile");
                              }
                            }),
                            child: Container(
                              width: tmp - 6,
                              // duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              // width: 100.w,

                              child: const Text('Profile'),
                            ),
                          ),
                          // SizedBox(width: 10.w),
                          // Expanded(
                          //   child: GestureDetector(
                          //     onTap: (() {
                          //       if (controller.intdexTabBar.value != 3) {
                          //         controller.intdexTabBar(3);
                          //       }
                          //     }),
                          //     child: AnimatedContainer(
                          //       duration: const Duration(milliseconds: 300),
                          //       decoration: BoxDecoration(
                          //         color: controller.intdexTabBar.value == 3
                          //             ? Colors.blue
                          //             : Colors.grey.shade200,
                          //         borderRadius: BorderRadius.circular(10.r),
                          //       ),
                          //       alignment: Alignment.center,
                          //       // width: 100.w,

                          //       child: const Text('Post'),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      AnimatedPositioned(
                        left: (controller.num.value + 3) *
                            controller.intdexTabBar.value,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          width: controller.num.value - 6,
                          height: 40.h,
                          // duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          alignment: Alignment.center,
                          // width: 100.w,

                          child: Text(controller.title.value),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // Obx(
          //   () => controller.listTabBar[controller.intdexTabBar.value],
          // ),
        ],
      ),
    );
  }
}
