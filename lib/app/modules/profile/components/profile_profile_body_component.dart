import 'package:intl/intl.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_row_item_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

import '../../../core/utils/export.dart';

class ProfileProfileBodyComponent extends GetWidget<ProfileController> {
  const ProfileProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String birthday = formatter.format(controller.user.value.birthday!);
    var gender = "";
    switch (controller.user.value.gender) {
      case Gender.empty:
        gender = "";
        break;
      case Gender.femail:
        gender = "Female";
        break;
      case Gender.male:
        gender = "Male";
        break;
      case Gender.other:
        gender = "Other";
        break;
      case null:
        break;
    }
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 25.h),
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
          value: birthday,
        ),
        SizedBox(height: 10.h),
        ProfileRowItemComponent(
          title: "Gender",
          value: gender,
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
