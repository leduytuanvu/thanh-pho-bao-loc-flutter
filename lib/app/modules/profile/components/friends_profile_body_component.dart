import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class FriendProfileBodyComponent extends GetWidget<ProfileController> {
  const FriendProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: StreamBuilder(
          stream: controller.searchUser(search: controller.search.value),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: EdgeInsets.only(top: 133.h),
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data!.docs.isNotEmpty) {
                log("${snapshot.data!.docs} lenght ne");
                return Padding(
                  padding: EdgeInsets.only(bottom: 100.h),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data =
                          snapshot.data!.docs[index].data();
                      // DateTime dt = (data['createdAt'] as Timestamp).toDate();
                      // var date = DateFormat("yyyy-MM-dd hh:mm:ss").format(dt);
                      return Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Row(
                          children: [
                            SizedBox(width: 25.w),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              // child: Image(
                              //   image: NetworkImage(data['image']),
                              //   width: 55.w,
                              //   height: 55.w,
                              //   fit: BoxFit.cover,
                              // ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data['image'],
                                height: 55.w,
                                width: 55.w,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Padding(
                                  padding: EdgeInsets.all(18.0.w),
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    strokeWidth: 1.w,
                                    color: Colors.black38,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(width: 17.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['fullName'] ?? "",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    data['email'] ?? "",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  // Text(date),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              color: Colors.transparent,
                              height: 40.h,
                              width: 50.w,
                              child: Lottie.asset(
                                'assets/videos/send.json',
                                height: 250.w,
                                width: 250.w,
                              ),
                            ),
                            SizedBox(width: 14.w),
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 140.h),
                  child: Text(
                    "Not found !",
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 14.sp,
                      // color: Colors.red,
                    ),
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
