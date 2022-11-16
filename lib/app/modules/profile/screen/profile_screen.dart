import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_header_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/tab_bar_profile_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
import '../../../core/utils/export.dart';

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
            SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileHeaderComponent(),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Obx(() => Text(
                          controller.fullName.value,
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
                        )),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Obx(() => Text(
                          controller.email.value,
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 14.sp,
                          ),
                        )),
                  ),
                  SizedBox(height: 30.h),
                  const TabBarProfileComponent(),
                  SizedBox(height: 5.h),
                  Obx(
                    () => controller.listTabBar[controller.intdexTabBar.value],
                  ),
                ],
              ),
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
                )),
            Obx(() => SizedBox(
                  child: controller.updateProfileState.value ==
                          UpdateProfileState.loading
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
                )),
            // TmpDialog(
            //   name: "test",
            //   onChangeName: (value) {
            //     print(value);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class TmpDialog extends StatelessWidget {
  const TmpDialog(
      {super.key, required this.name, this.onChangeName, this.onSubmit});
  final String name;
  final ValueChanged<String>? onChangeName;
  final ValueChanged<String>? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(),
        controller: TextEditingController(text: name),
        onChanged: (value) => onChangeName?.call(value),
      ),
    );
  }
}
