import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/components/custom_circle_camera_component.dart';
import '../core/utils/export.dart';

class ListDiscoverComponent extends StatelessWidget {
  const ListDiscoverComponent({super.key});

  List<Widget> getList() {
    List<String> listImage = [
      "assets/images/demo1.png",
      "assets/images/demo2.png",
      "assets/images/demo3.png",
      "assets/images/demo4.png",
      "assets/images/demo5.png",
      "assets/images/demo1.png",
      "assets/images/demo2.png",
      "assets/images/demo3.png",
      "assets/images/demo4.png",
      "assets/images/demo5.png",
    ];
    List<Widget> list = [];
    for (int i = 0; i <= listImage.length; i++) {
      if (i == 0) {
        list.add(
          Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? 10.w : 8.w,
              right: i == 4 ? 10.w : 0,
            ),
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
                  // Positioned.fill(
                  //   bottom: 40.h,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(10.r),
                  //         topRight: Radius.circular(10.r),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                            // backgroundImage: Icon(Icons)
                            // child: Icon(
                            //   Icons.add,
                            //   size: 20.sp,
                            //   color: Colors.white,
                            // ),
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
          ),
        );
      } else if (i == listImage.length) {
        list.add(
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 8.w),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.r),
              ),
              width: 130.w,
              height: 180.h,
              child: Center(
                child: Text(
                  "More",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        list.add(
          Padding(
            padding: EdgeInsets.only(
                left: i == 0 ? 10.w : 8.w, right: i == 4 ? 8.w : 0),
            child: Container(
              width: 130.w,
              height: 180.h,
              decoration: BoxDecoration(
                // color: i % 2 == 0 ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(10.r),
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
                      image: listImage[i],
                      padding: 2.w,
                      isNetwork: false,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SizedBox(
                    width: 130.w,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, bottom: 8.w, top: 8.w),
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
          ),
        );
      }
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
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              ...getList(),
            ],
          ),
        ),
      ),
    );
  }
}
