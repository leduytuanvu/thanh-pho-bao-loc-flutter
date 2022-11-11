import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_row_item_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class ProfileProfileBodyComponent extends GetWidget<ProfileController> {
  const ProfileProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 26.h),
        ProfileRowItemComponent(
          title: "Full name",
          value: controller.user.value.fullName!,
        ),
        SizedBox(height: 10.h),
        ProfileRowItemComponent(
          title: "Email",
          value: controller.user.value.email!,
        ),
        SizedBox(height: 10.h),
        ProfileRowItemComponent(
          title: "Phone",
          value: controller.user.value.phone == ""
              ? ""
              : controller.user.value.phone!,
        ),
        SizedBox(height: 10.h),
        ProfileRowItemComponent(
          title: "Birthday",
          value: controller.birthday.value,
        ),
        SizedBox(height: 10.h),
        ProfileRowItemComponent(
          title: "Gender",
          value: controller.gender.value,
        ),
        controller.user.value.signInByGoogle == true
            ? const SizedBox.shrink()
            : ProfileRowItemComponent(
                title: "Password",
                value: controller.user.value.password!,
              ),
      ],
    );
  }
}
