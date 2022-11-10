import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
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
            ),
          ),
          Positioned(
            top: 14.w,
            right: 12.5.w,
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
                child: Lottie.asset(
                  'assets/videos/logout.json',
                  height: 30.w,
                  width: 30.w,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: controller.user.value.image!,
                    // height: 50.r,
                    // width: 50.r,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                      strokeWidth: 1.w,
                      color: Colors.black38,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    // return const SizedBox();
  }
}
