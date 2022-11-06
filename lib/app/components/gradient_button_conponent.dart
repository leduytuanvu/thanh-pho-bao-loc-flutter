import '../core/utils/export.dart';

class GradientButtonWidget extends StatelessWidget {
  final String title;
  final Function()? function;
  final double height;
  final double width;
  final double fontSize;

  const GradientButtonWidget({
    super.key,
    required this.title,
    required this.function,
    this.height = 50,
    this.width = 100,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 1,
        minimumSize: Size(100.0.w, 50.0.h),
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0.r),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.buttonRadient1,
              // AppColors.buttonRadient2,
              AppColors.buttonRadient3,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Container(
          constraints: BoxConstraints(minWidth: 100.w, minHeight: 50.0.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
