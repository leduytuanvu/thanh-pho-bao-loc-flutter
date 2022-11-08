import 'package:thanh_pho_bao_loc/app/modules/message/components/friend_online_item_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';

import '../../../core/utils/export.dart';

class ListFriendOnlineComponent extends GetWidget<MessageController> {
  const ListFriendOnlineComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      // color: Colors.red,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 10.w),
          FriendOnlineItemComponent(
            name: "Thao Nhu",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 14.w),
          FriendOnlineItemComponent(
            name: "Tuan Vu",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 14.w),
          FriendOnlineItemComponent(
            name: "Thao Vi",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 14.w),
          FriendOnlineItemComponent(
            name: "Thanh Hiep",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 14.w),
          FriendOnlineItemComponent(
            name: "Thao Nhu",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 14.w),
          FriendOnlineItemComponent(
            name: "Tuan Vu",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 14.w),
          FriendOnlineItemComponent(
            name: "Thao Vi",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 10.w),
          FriendOnlineItemComponent(
            name: "Thanh Hiep",
            image: controller.user.value.image!,
          ),
          SizedBox(width: 10.w),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
