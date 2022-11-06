import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import '../../core/utils/export.dart';

class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        // EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        SizedBox(
          height: 45.h,
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Expanded(
                  child: Obx(
                () => TextField(
                  onTap: (() => controller.showSuffixIcon(true)),
                  autofocus: true,
                  onChanged: ((value) {
                    controller.search(value);
                  }),
                  controller: controller.searchKey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      // vertical: 10.w,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    hintText: " Search by name, email, phone number ...",
                    hintStyle: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.black26,
                    ),
                    suffixIcon: controller.showSuffixIcon.value
                        ? GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.showSuffixIcon(false);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.black54,
                            ),
                          )
                        : null,
                  ),
                  cursorColor: Colors.black12,
                  cursorWidth: 1.w,
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    color: Colors.black87,
                  ),
                  // cursorHeight: ,
                ),
              )),
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
                  padding: EdgeInsets.only(top: 133.h),
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data!.docs.isNotEmpty) {
                  log("${snapshot.data!.docs} lenght ne");
                  return ListView.builder(
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
                              SizedBox(width: 10.w),
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
                                  imageUrl: data['image'],
                                  height: 50.w,
                                  width: 50.w,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                    value: downloadProgress.progress,
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
                                height: 30.h,
                                width: 80.w,
                                child: GradientButtonWidget(
                                  fontSize: 12.sp,
                                  title: 'Add friend',
                                  function: () {},
                                ),
                              ),
                              SizedBox(width: 10.w),
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
      ],
    );
  }
}
