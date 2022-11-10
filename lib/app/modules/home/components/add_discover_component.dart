import 'package:lottie/lottie.dart';

import '../../../core/utils/export.dart';

class AddDiscoverComponent extends StatelessWidget {
  const AddDiscoverComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10.r),
        ),
        width: 130.w,
        height: 180.h,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
                child: Image.asset(
                  "assets/images/demo5.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.h,
                      child: Lottie.asset(
                        'assets/videos/add1.json',
                        height: 200.w,
                        width: 200.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
