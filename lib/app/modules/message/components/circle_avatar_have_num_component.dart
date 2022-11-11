import '../../../core/utils/export.dart';

class CircleAvatarHaveNumComponent extends StatelessWidget {
  const CircleAvatarHaveNumComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Image.asset(
            'assets/images/demo.png',
            fit: BoxFit.cover,
            height: 64.w,
            width: 64.w,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 18.w,
            width: 18.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.r),
              // image: NetworkImage(controller.user.value.image!)
            ),
            child: Padding(
              padding: EdgeInsets.all(1.5.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100.r),
                  // image: NetworkImage(controller.user.value.image!)
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
