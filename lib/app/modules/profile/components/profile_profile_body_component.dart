import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_row_item_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class ProfileProfileBodyComponent extends GetWidget<ProfileController> {
  const ProfileProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 26.h),
        const ProfileRowItemComponent(
          title: "Full name",
          // value: controller.user.value.fullName!,
        ),
        SizedBox(height: 10.h),
        const ProfileRowItemComponent(
          title: "Email",
          // value: controller.user.value.email!,
        ),
        SizedBox(height: 10.h),
        const ProfileRowItemComponent(
          title: "Phone",
          // value: controller.user.value.phone == ""
          //     ? ""
          //     : controller.user.value.phone!,
        ),
        SizedBox(height: 10.h),
        const ProfileRowItemComponent(
          title: "Birthday",
          // value: controller.birthday.value,
        ),
        SizedBox(height: 10.h),
        const ProfileRowItemComponent(
          title: "Gender",
          // value: controller.gender.value,
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: GradientButtonWidget(
            title: 'SIGN OUT',
            function: () {
              showDialog<String>(
                barrierColor: Colors.black87.withOpacity(0.8),
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Are you sure to logout ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 18.sp,
                    ),
                  ),
                  // content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    // TextButton(
                    //   onPressed: () => Get.back(),
                    //   child: Text(
                    //     'Cancel',
                    //     style: TextStyle(
                    //       fontFamily: GoogleFonts.montserrat().fontFamily,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35.w,
                            width: 90.w,
                            child: GradientButtonWidget(
                              title: 'Cancle',
                              function: (() => Get.back()),
                              fontSize: 15.sp,
                              radius: 8.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            height: 35.w,
                            width: 90.w,
                            child: GradientButtonWidget(
                              title: 'OK',
                              function: (() async {
                                await controller.signOut();
                              }),
                              fontSize: 15.sp,
                              radius: 8.r,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 120.h),
        controller.user.value.signInByGoogle == true
            ? const SizedBox.shrink()
            : const ProfileRowItemComponent(
                title: "Password",
                // value: controller.user.value.password!,
              ),
      ],
    );
  }
}
