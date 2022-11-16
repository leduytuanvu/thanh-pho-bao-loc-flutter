import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/components/search_header_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/controller/search_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/view_other_profile/screen/view_other_profile_screen.dart';
import '../../../core/utils/export.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;

class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 15.h),
        // EdgeInsets.symmetric(horizontal: 10.w, verical: 15.h),
        const SearchHeaderComponent(),
        SizedBox(height: 10.h),
        Obx(
          () => StreamBuilder(
            stream: controller.searchUser(search: controller.search.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.only(top: 64.5.h),
                  child: Lottie.asset(
                    'assets/videos/loading.json',
                    height: 120.w,
                    width: 120.w,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data!.docs.isNotEmpty) {
                  // log("${snapshot.data!.docs} lenght ne");
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data =
                          snapshot.data!.docs[index].data();
                      user_entity.User newUser =
                          user_entity.User.fromJson(data, true);
                      // DateTime dt = (data['createdAt'] as Timestamp).toDate();
                      // var date = DateFormat("yyyy-MM-dd hh:mm:ss").format(dt);
                      return Column(
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              SizedBox(width: 16.w),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => ViewOtherProfileScreen(),
                                    arguments: newUser,
                                  );
                                },
                                child: ClipRRect(
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
                                    imageUrl: newUser.image!,
                                    height: 50.w,
                                    width: 50.w,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Padding(
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
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newUser.fullName ?? "",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.montserrat().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      newUser.email ?? "",
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
                              SizedBox(
                                // height: 30.h,
                                // width: 30.w,
                                child: Lottie.asset(
                                  'assets/videos/add_friend.json',
                                  height: 45.w,
                                  width: 45.w,
                                ),
                              ),
                              SizedBox(width: 3.w),
                            ],
                          ),
                          SizedBox(height: 10.h),
                        ],
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: 120.h),
                    child: Center(
                      child: Text(
                        "Not found !",
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 14.sp,
                          // color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
