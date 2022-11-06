import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';
import '../../../core/utils/export.dart';

class ProfileBodyComponent extends GetWidget<ProfileController> {
  const ProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: Text(
              'Le Duy Tuan Vu',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 5.h),
            child: Text(
              'leduytuanvu.work@gmail.com',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
