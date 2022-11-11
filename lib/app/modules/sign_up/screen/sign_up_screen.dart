import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/components/custom_text_field_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/sign_up/controller/sign_up_controller.dart';
import '../../../core/utils/export.dart';

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
                      'assets/videos/funny17.json',
                      height: 240.w,
                      width: 240.w,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextFieldWidget(
                      hint: 'Email',
                      controller: controller.emailTextController,
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
                    SizedBox(height: 35.h),
                    GradientButtonWidget(
                        fontSize: 15.sp,
                        title: 'SIGN UP',
                        function: () {
                          controller.signUpWithEmailPassword();
                        }),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You already have an account.',
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: Colors.black45,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.goToSignInScreen();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            // height: 30.h,
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 15.h),
                              child: Text(
                                'Sign in now',
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                  color: AppColors.buttonRadient3,
                                  fontSize: 15,
                                ),
                              ),
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
                child: controller.signUpState.value == SignUpState.loading
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
