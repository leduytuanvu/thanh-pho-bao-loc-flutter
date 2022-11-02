import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHeaderComponent extends GetWidget {
  const SearchHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 45.h,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100.0.r),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.search,
                        color: Colors.black26,
                        size: 22.sp,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          'Search by name',
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.w),
            CircularProfileAvatar(
              '',
              borderColor: Colors.black26,
              borderWidth: 2,
              elevation: 2,
              radius: 22.r,
              child: const FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
