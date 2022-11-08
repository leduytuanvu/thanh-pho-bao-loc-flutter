import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
                child: Image.network(image),
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
          ),
        )
      ],
    );
  }
}
