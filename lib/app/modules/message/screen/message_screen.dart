import 'package:thanh_pho_bao_loc/app/modules/message/components/circle_avatar_have_num_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/components/circle_avatar_not_have_num_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/components/have_new_message_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/components/list_friend_online_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/components/not_have_new_message_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/controller/message_controller.dart';
import '../../../core/utils/export.dart';

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
          SizedBox(height: 16.h),
          const ListFriendOnlineComponent(),
          Divider(
            height: 0.h,
            thickness: 0.2.h,
            color: Colors.black12,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: const [
                CircleAvatarHaveNumComponent(),
                HaveNewMessageComponent(),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(
            height: 0.h,
            thickness: 0.2.h,
            color: Colors.black12,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: const [
                CircleAvatarNotHaveNumComponent(),
                NotHaveNewMessageComponent(),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(
            height: 0.h,
            thickness: 0.2.h,
            color: Colors.black12,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: const [
                CircleAvatarHaveNumComponent(),
                HaveNewMessageComponent(),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(
            height: 0.h,
            thickness: 0.2.h,
            color: Colors.black12,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: const [
                CircleAvatarHaveNumComponent(),
                HaveNewMessageComponent(),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(
            height: 0.h,
            thickness: 0.2.h,
            color: Colors.black12,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: const [
                CircleAvatarNotHaveNumComponent(),
                NotHaveNewMessageComponent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
