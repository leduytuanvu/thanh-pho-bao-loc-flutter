import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_header_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';
import '../../core/utils/export.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return controller.shouldPop.value;
      },
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const ProfileHeaderComponent(),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    controller.user.value.fullName!,
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
                    controller.user.value.email!,
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
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

                                    child: Text(
                                      'Post',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.montserrat().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
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

                                    child: Text(
                                      'Friends',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.montserrat().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
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

                                    child: Text(
                                      'Profile',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.montserrat().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AnimatedPositioned(
                              left: (controller.num.value + 3) *
                                  controller.intdexTabBar.value,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                width: controller.num.value - 6,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      AppColors.buttonRadient1,
                                      AppColors.buttonRadient3,
                                    ],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  controller.title.value,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Obx(
                  () => controller.listTabBar[controller.intdexTabBar.value],
                ),
              ],
            ),
            Obx(() => SizedBox(
                  child: controller.signOutState.value == SignOutState.loading
                      ? Container(
                          height: size.height,
                          width: size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Center(
                            child: Lottie.asset(
                              'assets/videos/loading.json',
                              height: 250.w,
                              width: 250.w,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ))
          ],
        ),
      ),
    );
  }
}
