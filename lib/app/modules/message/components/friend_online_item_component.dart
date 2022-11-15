import 'package:thanh_pho_bao_loc/app/modules/message/controller/message_controller.dart';

import '../../../core/utils/export.dart';

class FriendOnlineItemComponent extends GetWidget<MessageController> {
  final String name;
  final String image;
  const FriendOnlineItemComponent({
    super.key,
    required,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 64.w,
            width: 64.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100.r),
              // image: NetworkImage(controller.user.value.image!)
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.network(
                    image,
                    height: 64.w,
                    width: 64.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 2.5.w,
                  bottom: 2.5.w,
                  child: Container(
                    height: 14.w,
                    width: 14.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.r),
                      // image: NetworkImage(controller.user.value.image!)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.5.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100.r),
                          // image: NetworkImage(controller.user.value.image!)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 11.sp,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
