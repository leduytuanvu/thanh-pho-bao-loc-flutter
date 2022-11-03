import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatarComponent extends StatelessWidget {
  final double height;
  final double width;
  final Color color1;
  final Color color2;
  final double padding;
  const CustomCircleAvatarComponent({
    super.key,
    required this.height,
    required this.width,
    required this.color1,
    required this.color2,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: color1,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: color2,
          ),
          child: Center(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
