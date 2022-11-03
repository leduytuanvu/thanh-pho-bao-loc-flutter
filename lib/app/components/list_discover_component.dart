import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanh_pho_bao_loc/app/components/custom_circle_camera_component.dart';

class ListDiscoverComponent extends StatelessWidget {
  const ListDiscoverComponent({super.key});

  List<Widget> getList() {
    List<String> listImage = [
      "assets/images/demo1.png",
      "assets/images/demo2.png",
      "assets/images/demo3.png",
      "assets/images/demo4.png",
      "assets/images/demo5.png",
    ];
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      if (i == 0) {
        list.add(
          Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? 10.w : 8.w,
              right: i == 4 ? 10.w : 0,
            ),
            child: Container(
              width: 135.w,
              height: 179.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black45.withOpacity(0.2),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 60.sp,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ),
          ),
        );
      }
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
              image: DecorationImage(
                image: AssetImage(listImage[i]),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: CustomCircleAvatarComponent(
                    height: 30.w,
                    width: 30.w,
                    color1: Colors.white,
                    color2: Colors.blue,
                    padding: 2.w,
                  ),
                ),
                SizedBox(width: 5.w),

                // color: Colors.amber,
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Text(
                    'Le Duy Tuan Vu',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
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
    return SizedBox(
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
