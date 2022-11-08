import 'package:thanh_pho_bao_loc/app/modules/message/components/list_friend_online_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';
import '../../core/utils/export.dart';

class MessageScreen extends GetWidget<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.user(LocalStorageService.getUser().data);
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              'Message',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          const ListFriendOnlineComponent(),
          Row(
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.w),
                  color: Colors.pink,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
