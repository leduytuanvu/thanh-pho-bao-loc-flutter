import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PostComponent extends StatelessWidget {
  final String image;
  const PostComponent({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Row(
            children: [
              Container(
                height: 42.w,
                width: 42.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100.r,
                  ),
                  color: Colors.blue,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(
                    "assets/images/photo1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Le Duy Tuan Vu',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/menu.png",
                                  height: 20.w,
                                  width: 20.w,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '2hours ago',
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            '#relax, #travel',
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 12.sp,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'Airport Hotels The Right Way To Start A Short Break Holiday',
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 14.sp,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: SizedBox(
            height: 500.w,
            width: double.infinity,
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(8.0.r),
              child: Image.asset(
                "assets/images/$image.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.w, top: 12.w, bottom: 8.w),
              child: Image.asset(
                "assets/images/heart.png",
                height: 20.w,
                width: 20.w,
                color: Colors.black45,
              ),
            ),
            //
          ],
        )
      ],
    );
  }
}
