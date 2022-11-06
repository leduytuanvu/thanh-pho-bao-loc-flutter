import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanh_pho_bao_loc/app/modules/bottom_bar/bottom_bar_controller.dart';
import '../core/utils/export.dart';

class BottomIconBottomComponent extends GetWidget<BottomBarController> {
  final int index;
  final String image;
  final String lable;
  const BottomIconBottomComponent({
    super.key,
    required this.index,
    required this.image,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.index.value = index;
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          // color: Colors.red,
        ),
        duration: const Duration(milliseconds: 300),
        height: 51.h,
        width: 71.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.0.h),
            SizedBox(
              height: 18.0..w,
              width: 18.0.w,
              child: Center(
                child: Obx(() => SvgPicture.asset(
                      'assets/svgs/$image',
                      color: controller.index.value == index
                          ? Colors.black87
                          : Colors.black26,
                    )),
              ),
            ),
            const SizedBox(height: 4.0),
            Obx(() => Text(
                  lable,
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    color: controller.index.value == index
                        ? Colors.black87
                        : Colors.black26,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
