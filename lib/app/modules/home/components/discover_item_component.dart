import 'package:thanh_pho_bao_loc/app/components/custom_circle_camera_component.dart';

import '../../../core/utils/export.dart';

class DiscoverItemComponent extends StatelessWidget {
  final String image;
  final bool isEnd;
  const DiscoverItemComponent({
    super.key,
    required this.image,
    this.isEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 10.w : 8.w),
      child: Container(
        width: 130.w,
        height: 180.h,
        decoration: BoxDecoration(
          // color: i % 2 == 0 ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: AssetImage(image),
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
                image: image,
                padding: 2.w,
                isNetwork: false,
              ),
            ),
            SizedBox(width: 5.w),
            SizedBox(
              width: 130.w,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, bottom: 8.w, top: 8.w),
                child: Text(
                  'Lê Thảo Như',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        blurRadius: 1.0,
                        color: Colors.black,
                        offset: Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
