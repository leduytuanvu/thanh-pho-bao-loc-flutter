import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';
import '../../../core/utils/export.dart';

class ProfileHeaderComponent extends GetWidget<ProfileController> {
  const ProfileHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 50.r,
            child: Container(
              color: Colors.grey.shade200,
              child: Image.network(
                "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 15.w,
            right: 15.w,
            child: GestureDetector(
              onTap: () {
                // await controller.signOut();
                showDialog<String>(
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
                              ),
                            ),
                          ],
                        ),
                      )
                      // TextButton(
                      //   onPressed: () async {
                      //     await controller.signOut();
                      //   },
                      //   child: Text(
                      //     'OK',
                      //     style: TextStyle(
                      //       fontFamily: GoogleFonts.montserrat().fontFamily,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
              child: Container(
                // color: Colors.grey.shade200,
                child: const Icon(
                  Icons.logout,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50.r,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: CircleAvatar(
                  radius: 48.r,
                  backgroundImage: NetworkImage(
                    controller.user.value.image!,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
