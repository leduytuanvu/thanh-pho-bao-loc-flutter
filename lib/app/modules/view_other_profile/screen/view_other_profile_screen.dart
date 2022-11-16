import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/utils/export.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

class ViewOtherProfileScreen extends StatelessWidget {
  final user = Get.arguments as user_entity.User;
  ViewOtherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200.r,
            // color: Colors.red,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 30.r,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: user.wallpaper!,
                    // height: 94.r,
                    // width: 94.r,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Padding(
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                              contentPadding: EdgeInsets.zero,
                              content: Image.network(
                                user.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                          // await showDialog(
                          //   context: context,
                          //   builder: (_) => ImageDialogComponent(
                          //     url: controller.user.value.image!,
                          //   ),
                          // );
                        },
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
                                imageUrl: user.image!,
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
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  user.fullName!,
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
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  user.email!,
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          )
          // const TabBarProfileComponent(),
          // SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
