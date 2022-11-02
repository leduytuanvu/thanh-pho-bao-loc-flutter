import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDiscoverComponent extends StatelessWidget {
  const ListDiscoverComponent({super.key});

  List<Widget> getList() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        Padding(
          padding: EdgeInsets.only(
              left: i == 0 ? 10.w : 8.w, right: i == 4 ? 10.w : 0),
          child: Container(
            width: 135.w,
            height: 179.h,
            decoration: BoxDecoration(
              color: i % 2 == 0 ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/photo1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6.w, top: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0XFFF78361),
                              // AppColors.buttonRadient2,
                              Color(0xFFF54B64),
                            ],
                          ),
                        ),
                        height: 18.h,
                        width: 48.w,
                        child: Row(
                          children: [
                            SizedBox(width: 5.w),
                            Icon(Icons.camera, size: 12.sp),
                            const Spacer(),
                            Text('LIVE', style: TextStyle(fontSize: 12.sp)),
                            SizedBox(width: 5.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, bottom: 6.h),
                  child: Row(
                    children: [
                      CircularProfileAvatar(
                        '',
                        borderColor: Color(0xFFFF2D55),
                        // backgroundColor: Colors.transparent,\

                        borderWidth: 2,
                        elevation: 2,
                        radius: 14.r,
                        child: const FlutterLogo(),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Le Duy Tuan Vu',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185.h,
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...getList(),
          ],
        ),
      ),
    );
  }
}
