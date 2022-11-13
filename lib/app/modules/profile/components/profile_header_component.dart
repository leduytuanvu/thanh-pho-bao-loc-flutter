import 'package:cached_network_image/cached_network_image.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
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
            bottom: 30.r,
            child: Image.asset(
              "assets/images/demo.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                showDialog<String>(
                  // barrierDismissible: false,
                  barrierColor: Colors.black87.withOpacity(0.8),
                  context: context,

                  builder: (BuildContext context) => AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: Image.network(
                      controller.user.value.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 49.r,
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
                      // height: 85.r,
                      // width: 85.r,
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
          )
        ],
      ),
    ); // return const SizedBox();
  }
}
