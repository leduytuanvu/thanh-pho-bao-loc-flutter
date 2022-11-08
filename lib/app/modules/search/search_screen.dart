import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import '../../core/utils/export.dart';

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
        SizedBox(
          height: 45.h,
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Expanded(
                child: Obx(
                  () => TextField(
                    // onSubmitted: ((value) => controller.showSuffixIcon(false)),
                    onTap: (() => controller.showSuffixIcon(true)),
                    autofocus: controller.autofocus.value,
                    onChanged: ((value) {
                      controller.search(value);
                    }),
                    controller: controller.searchKey,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search by email",
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: Colors.black26,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15.w, right: 11.w),
                        child: Lottie.asset(
                          'assets/videos/search1.json',
                          height: 19.w,
                          width: 19.w,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.showSuffixIcon(false);
                          controller.autofocus(false);
                        },
                        child: controller.search.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  controller.searchKey.clear();
                                  controller.search("");
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black54,
                                  size: 21.sp,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                    cursorColor: Colors.black12,
                    cursorWidth: 0.6.w,
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: Colors.black87,
                        fontSize: 16.sp),
                    // cursorHeight: ,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
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
                  log("${snapshot.data!.docs} lenght ne");
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data =
                          snapshot.data!.docs[index].data();
                      // DateTime dt = (data['createdAt'] as Timestamp).toDate();
                      // var date = DateFormat("yyyy-MM-dd hh:mm:ss").format(dt);
                      return Column(
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              SizedBox(width: 16.w),
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
                              SizedBox(width: 10.w),
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
                          // Divider(
                          //   color: Colors.black12,
                          //   thickness: 10.h,
                          // ),
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
