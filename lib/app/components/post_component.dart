import '../core/utils/export.dart';

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
                height: 45.w,
                width: 45.w,
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
                                  'Thảo Như Xinh Đẹp',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "assets/images/menu.png",
                                    height: 20.w,
                                    width: 20.w,
                                    color: Colors.black38,
                                  ),
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
              padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 10.w),
              child: Image.asset(
                "assets/images/heart.png",
                height: 20.w,
                width: 20.w,
                color: Colors.black45,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 5.5.h),
              child: Text(
                '234',
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 16.sp,
                  letterSpacing: 1.2.w,
                ),
              ),
            ),
            //
          ],
        )
      ],
    );
  }
}
