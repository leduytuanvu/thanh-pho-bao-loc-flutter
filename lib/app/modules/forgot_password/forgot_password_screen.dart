import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/modules/forgot_password/forgot_password_controller.dart';
import 'package:thanh_pho_bao_loc/app/components/custom_text_field_component.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () {
            controller.goToSignInScreen();
          },
        ),
        title: Text(
          'Forgot password',
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 16.sp,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 40.h),
                Obx(() => Image.asset(
                      controller.sentCode.value
                          ? 'assets/images/logo_reset_password.png'
                          : 'assets/images/logo_forgot_password.png',
                    )),
                SizedBox(height: 24.h),
                Obx(() => Text(
                      controller.sentCode.value
                          ? 'Please enter your email below to receive your password reset instructions.'
                          : 'Reset code was sent to your email. Please enter the code and create new password.',
                      style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(height: 40.h),
                Obx(() => CustomTextFieldWidget(
                      hint: !controller.sentCode.value ? 'Phone' : 'Code',
                      controller: controller.codeTextController,
                      obscureText: false,
                      function: () {},
                      icon: Icons.visibility,
                    )),
                Obx(() =>
                    SizedBox(height: controller.sentCode.value ? 10.h : 0)),
                Obx(() => SizedBox(
                      child: controller.sentCode.value
                          ? CustomTextFieldWidget(
                              hint: 'New password',
                              controller: controller.phoneTextController,
                              obscureText: false,
                              function: () {},
                              icon: Icons.visibility,
                            )
                          : null,
                    )),
                Obx(() =>
                    SizedBox(height: controller.sentCode.value ? 10.h : 0)),
                Obx(() => SizedBox(
                      child: controller.sentCode.value
                          ? CustomTextFieldWidget(
                              hint: 'Repeat new password',
                              controller: controller.phoneTextController,
                              obscureText: false,
                              function: () {},
                              icon: Icons.visibility,
                            )
                          : null,
                    )),
                Obx(() =>
                    SizedBox(height: controller.sentCode.value ? 30.h : 20.h)),
                Obx(() => GradientButtonWidget(
                      title: !controller.sentCode.value
                          ? 'SEND'
                          : 'CHANGE PASSWORD',
                      function: () {
                        !controller.sentCode.value
                            ? controller.sendCode(phone: '0961191732')
                            : controller.checkCode(
                                code: controller.codeTextController.text);
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
