import '../../../core/utils/export.dart';

class NotHaveNewMessageComponent extends StatelessWidget {
  const NotHaveNewMessageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Le Thao Nhu',
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  '12:00 AM',
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 13.sp,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              'What kind of food do you like? And What do you like to eat?',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 13.sp,
                height: 1.4,
                // fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
