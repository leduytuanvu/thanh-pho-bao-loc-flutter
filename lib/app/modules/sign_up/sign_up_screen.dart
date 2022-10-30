import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_text_styles.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_in/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/components/custom_text_field_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/sign_up_controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(32.0.w),
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/videos/funny12.json',
                      height: 270.w,
                      width: 270.w,
                    ),
                    // SizedBox(height: 30.h),
                    CustomTextFieldWidget(
                      hint: 'Email or phone number',
                      controller: controller.phoneOrEmailTextController,
                      obscureText: false,
                      function: () {},
                      icon: null,
                    ),
                    SizedBox(height: 8.h),
                    Obx(() => CustomTextFieldWidget(
                          hint: 'Password',
                          controller: controller.passwordTextController,
                          obscureText: !controller.isShowPassword.value,
                          function: () {
                            controller.isShowPassword.value =
                                !controller.isShowPassword.value;
                          },
                          icon: controller.isShowPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    SizedBox(height: 8.h),
                    Obx(() => CustomTextFieldWidget(
                          hint: 'Re-enter password',
                          controller: controller.rePasswordTextController,
                          obscureText: !controller.isShowPassword.value,
                          function: () {
                            controller.isShowPassword.value =
                                !controller.isShowPassword.value;
                          },
                          icon: controller.isShowPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    SizedBox(height: 32.h),
                    GradientButtonWidget(
                        title: 'SIGN UP',
                        function: () {
                          controller.signUpByEmailPassword(context: context);
                        }),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You already have an account. ',
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.goToSignInScreen();
                          },
                          child: Text(
                            'Sign in now',
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: AppColors.buttonRadient3,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 110.h),
                  ],
                ),
              ),
            ),
          ),
          Obx(() => SizedBox(
                child: controller.signUpState.value == SignInState.loading
                    ? Container(
                        height: size.height,
                        width: size.width,
                        color: Colors.white.withOpacity(0.3),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black26,
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
