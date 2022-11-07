import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';
import '../../../core/utils/export.dart';

class ProfileHeaderComponent extends GetWidget<ProfileController> {
  const ProfileHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 30.r,
            child: Container(
              color: Colors.grey.shade200,
              child: Image.network(
                "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000",
                fit: BoxFit.cover,
              ),
              // child: CachedNetworkImage(
              //   fit: BoxFit.cover,
              //   imageUrl:
              //       "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000",
              //   height: 50.w,
              //   width: 50.w,
              //   progressIndicatorBuilder: (context, url, downloadProgress) =>
              //       CircularProgressIndicator(
              //     value: downloadProgress.progress,
              //   ),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
            ),
          ),
          Positioned(
            top: 15.w,
            right: 15.w,
            child: GestureDetector(
              onTap: () async {
                await controller.signOut();
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
                  backgroundImage: const NetworkImage(
                    "https://static.remove.bg/remove-bg-web/ea3c274e1b7f6fbbfe93fad8b2b13d7ef352f09c/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg",
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