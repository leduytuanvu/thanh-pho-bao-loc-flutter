import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatarComponent extends StatelessWidget {
  final double height;
  final double width;
  final Color color1;
  final String image;
  final double padding;
  final bool isNetwork;
  const CustomCircleAvatarComponent({
    super.key,
    required this.height,
    required this.width,
    required this.color1,
    required this.image,
    required this.padding,
    this.isNetwork = true,
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
        // child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(100.r),
        //     // color: color2,
        //   ),
        //   child: Image.network(image, fit: BoxFit.cover),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: isNetwork
              ? Image.network(image, fit: BoxFit.cover)
              : Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
