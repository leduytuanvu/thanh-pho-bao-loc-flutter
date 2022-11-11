import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class TabBarProfileComponent extends GetWidget<ProfileController> {
  const TabBarProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                          controller.title("POST (12)");
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
                          'POST (12)',
                          style: TextStyle(
                            // fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp, letterSpacing: 0.7,
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
                          controller.title("FRIENDS (256)");
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
                          'FRIENDS (256)',
                          style: TextStyle(
                            // fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp, letterSpacing: 0.7,
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
                          controller.title("PROFILE");
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
                          'PROFILE',
                          style: TextStyle(
                            // fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp, letterSpacing: 0.7,
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
                        // fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13.sp,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
