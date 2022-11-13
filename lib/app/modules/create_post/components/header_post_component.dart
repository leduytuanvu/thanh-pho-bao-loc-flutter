import 'package:thanh_pho_bao_loc/app/modules/create_post/controller/create_post_controller.dart';

import '../../../core/utils/export.dart';

class HeaderPostComponent extends GetWidget<CreatePostController> {
  const HeaderPostComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 8.w, top: 8.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),
            child: Image.asset(
              "assets/images/demo.png",
              height: 55.w,
              width: 55.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Le Duy Tuan Vu',
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  // Obx(
                  //   () => Container(
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.shade200,
                  //       borderRadius: BorderRadius.circular(4.r),
                  //     ),
                  //     width: 80.w,
                  //     height: 40.h,
                  //     child: Center(
                  //       child: Padding(
                  //         padding:
                  //             EdgeInsets.only(left: 7.w, top: 0, bottom: 0),
                  //         child: DropdownButton<String>(
                  //           onTap: (() {}),
                  //           borderRadius: BorderRadius.circular(4.r),
                  //           value: controller.dropdownValue.value,
                  //           isExpanded: true,
                  //           // icon: Padding(
                  //           //   padding: EdgeInsets.only(right: 2.w),
                  //           //   child: Icon(
                  //           //     Icons.arrow_drop_down,
                  //           //     size: 15.sp,
                  //           //   ),
                  //           // ),
                  //           elevation: 0,
                  //           style: TextStyle(
                  //             color: Colors.black87,
                  //             fontSize: 13.sp,
                  //             fontFamily: GoogleFonts.montserrat().fontFamily,
                  //           ),
                  //           onChanged: (String? value) {
                  //             controller.dropdownValue(value);
                  //           },
                  //           underline: const SizedBox.shrink(),
                  //           items: controller.list
                  //               .map<DropdownMenuItem<String>>((String value) {
                  //             return DropdownMenuItem<String>(
                  //               value: value,
                  //               child: Text(
                  //                 value,
                  //                 style: TextStyle(
                  //                   fontFamily:
                  //                       GoogleFonts.montserrat().fontFamily,
                  //                   color: Colors.black87,
                  //                   fontSize: 13.sp,
                  //                 ),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(width: 6.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    // width: 75.w,
                    height: 26.h,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              // content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // controller.getFromGallery();
                                        },
                                        child: Container(
                                          height: 200.w,
                                          width: 200.w,
                                          color: Colors.red,
                                          child: TextButton(
                                            onPressed: () {
                                              // controller.getFromGallery();
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: const Text(
                                              'Choose picture from gallery',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // controller.getFromCamera();
                                        },
                                        child: Container(
                                          height: 200.w,
                                          width: 200.w,
                                          color: Colors.black,
                                          child: TextButton(
                                            onPressed: () {
                                              // controller.getFromCamera();
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: const Text(
                                              'Choose picture from camera',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            'Add picture',
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: Colors.black87,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    // width: 70.w,
                    height: 26.h,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              // content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 11.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.getVideoFromCamera();
                                        },
                                        child: Container(
                                          height: 100.w,
                                          width: 100.w,
                                          color: Colors.red,
                                          child: TextButton(
                                            onPressed: () {
                                              controller
                                                  .getPictureFromGallery();
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: const Text('Gallery'),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.getMutilImageFromGallary();
                                        },
                                        child: Container(
                                          height: 100.w,
                                          width: 100.w,
                                          color: Colors.black,
                                          child: TextButton(
                                            onPressed: () {
                                              controller.getPictureFromCamera();
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: const Text('Camera'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            'Add video',
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: Colors.black87,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
