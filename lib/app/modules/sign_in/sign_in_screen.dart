import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_icons.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/components/custom_text_field_component.dart';

class SignInScreen extends GetWidget<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/videos/funny1.json',
                    height: 250.w,
                    width: 250.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomTextFieldWidget(
                      hint: 'Email or phone number',
                      function: () {},
                      icon: null,
                      controller: controller.emailOrPhoneTextController,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Obx(() => CustomTextFieldWidget(
                          hint: 'Password',
                          controller: controller.passwordTextController,
                          obscureText:
                              controller.isShowPassword.value ? false : true,
                          function: () => controller.setIsShowPassword(),
                          icon: controller.isShowPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                  ),
                  SizedBox(height: 35.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: GradientButtonWidget(
                        title: 'SIGN IN',
                        function: () {
                          controller.createUser(context: context);
                        }),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have account. ',
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.goToSignUpScreen();
                        },
                        child: Text(
                          'Sign up now',
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: AppColors.buttonRadient3,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'or sign in with',
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.white10,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async => await controller.signInGoogle(),
                        child: SizedBox(
                          height: 22.w,
                          width: 22.w,
                          child: Image.asset(AppIcons.signInGoogle),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      SizedBox(
                        height: 22.w,
                        width: 22.w,
                        child: Image.asset(AppIcons.signInFacebook),
                      ),
                      SizedBox(width: 16.w),
                      SizedBox(
                        height: 22.w,
                        width: 22.w,
                        child: Image.asset(AppIcons.signInTwitter),
                      ),
                    ],
                  ),
                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ),
          Obx(() => SizedBox(
                child: controller.signInState.value == SignInState.loading
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
    );
  }
}
