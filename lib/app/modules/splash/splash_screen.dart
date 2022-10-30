import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/splash_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          child: Lottie.asset(
            'assets/videos/loading.json',
            height: 250.w,
            width: 250.w,
          ),
        ),
      ),
    );
  }
}
