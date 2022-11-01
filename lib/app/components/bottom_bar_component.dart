import 'package:flutter/material.dart';
import 'package:thanh_pho_bao_loc/app/components/bottom_icon_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          // borderRadius: BorderRadius.circular(100.0.r),
        ),
        height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomIconBottomWidget(
              index: 0,
              image: 'house_solid.svg',
              lable: 'Home',
            ),
            BottomIconBottomWidget(
              index: 1,
              image: 'search_solid.svg',
              lable: 'Search',
            ),
            BottomIconBottomWidget(
              index: 2,
              image: 'plus.svg',
              lable: 'Post',
            ),
            // BottomIconBottomWidget(
            //   index: 3,
            //   image: 'cart_shopping_solid.svg',
            //   lable: 'Order',
            // ),
            BottomIconBottomWidget(
              index: 4,
              image: 'user_solid.svg',
              lable: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}