import 'package:cached_network_image/cached_network_image.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
import '../../../core/utils/export.dart';

class ProfileHeaderComponent extends GetWidget<ProfileController> {
  const ProfileHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.r,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 30.r,
            child: GestureDetector(
              onTap: () async {
                await showDialog<String>(
                  barrierColor: Colors.black87.withOpacity(0.8),
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    content: SizedBox(
                      height: 180.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 15.h),
                          GestureDetector(
                            onTap: () async {
                              await showDialog<String>(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: EdgeInsets.zero,
                                  content: Image.network(
                                    controller.user.value.wallpaper!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                              Get.back();
                            },
                            child: Container(
                              height: 40.h,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    "See wallpaper",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: () {
                              controller.getWallpaperPictureFromCamera();
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 40.h,
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    "Take a photo",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: () {
                              controller.getWallpaperPictureFromGallery();
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 40.h,
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  const Icon(
                                    Icons.photo,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    "Choose a photo",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Obx(
                () => CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: controller.user.value.wallpaper!,
                  // height: 94.r,
                  // width: 94.r,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Padding(
                    padding: EdgeInsets.only(top: 40.0.r),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 20.r,
                        width: 20.r,
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          strokeWidth: 1.w,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    await showDialog<String>(
                      barrierColor: Colors.black87.withOpacity(0.8),
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                        content: SizedBox(
                          height: 180.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 15.h),
                              GestureDetector(
                                onTap: () async {
                                  await showDialog<String>(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding: EdgeInsets.zero,
                                      content: Image.network(
                                        controller.user.value.image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                  Get.back();
                                },
                                child: Container(
                                  height: 40.h,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.w),
                                      const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "See avatar",
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () {
                                  controller.getImagePictureFromCamera();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: 40.h,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.w),
                                      const Icon(
                                        Icons.camera_alt,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "Take a photo",
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () {
                                  controller.getImagePictureFromGallery();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: 40.h,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.w),
                                      const Icon(
                                        Icons.photo,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "Choose a photo",
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.r,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: controller.user.value.image!,
                            height: 95.r,
                            width: 95.r,
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
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ); // return const SizedBox();
  }
}
