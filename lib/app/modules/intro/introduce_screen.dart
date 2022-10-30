import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanh_pho_bao_loc/app/modules/intro/introduce_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';

class IntroduceScreen extends GetWidget<IntroduceController> {
  const IntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 85.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() => Text(
                        controller.listTitle[controller.index.value],
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < controller.listTitle.length; i++)
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: controller.index.value == i ? 30.w : 10.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: controller.index.value == i
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 34.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      controller.listImg[controller.index.value],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                  child: Column(
                    children: [
                      GradientButtonWidget(
                        title: 'GET STARTED',
                        function: () {
                          int index = controller.index.value;
                          int listSize = controller.listTitle.length - 1;
                          if (index < listSize) {
                            controller.index++;
                          } else {
                            controller.getStarted();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
