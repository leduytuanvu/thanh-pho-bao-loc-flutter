import 'package:intl/intl.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/core/extensions/extensions.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_date_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_gender_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_phone_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_text_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class ProfileRowItemComponent extends GetWidget<ProfileController> {
  final String title;
  const ProfileRowItemComponent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = const SizedBox.shrink();
    Widget value = const SizedBox.shrink();
    switch (title) {
      case "Full name":
        content = ContentDialogTextComponent(
          textController: controller.fullNameTextController,
        );
        value = Obx(() => Text(
              controller.fullName.value,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
        break;
      case "Email":
        content = ContentDialogTextComponent(
          textController: controller.emailTextController,
        );
        value = Obx(() => Text(
              controller.email.value,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
        break;
      case "Phone":
        content = ContentDialogPhoneComponent(
          textController: controller.phoneTextController,
        );
        value = Obx(() => Text(
              controller.phone.value,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
        break;
      case "Birthday":
        content = const ContentDialogDateComponent();
        value = Obx(
          () => Text(
            // controller.birthday.value,
            DateFormat.yMMMMd('en_US').format(
              DateFormat("dd-MM-yyyy").parse(controller.birthday.value),
            ),
            // controller.birthday.value,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 15.sp,
            ),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
        break;
      case "Gender":
        content = ContentDialogGenderComponent(
          textController: controller.textController,
        );
        value = Obx(() => Text(
              controller.gender.value,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
        break;
    }

    return Container(
      color: Colors.grey.shade100.withOpacity(0.6),
      child: Padding(
        padding: EdgeInsets.only(left: 13.w),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(child: value),
            GestureDetector(
              onTap: () {
                switch (title) {
                  case "Full name":
                    controller.fullNameTextController.text =
                        controller.fullName.value;
                    break;
                  case "Email":
                    controller.emailTextController.text =
                        controller.email.value;
                    break;
                  case "Phone":
                    controller.phoneTextController.text =
                        controller.phone.value;
                    break;
                  case "Gender":
                    String tmp = controller.user.value.gender!.genderToString
                        .capitalizeFirstLetter;
                    tmp == "Empty"
                        ? controller.genderTmp("Choose gender")
                        : controller.genderTmp(tmp);
                    break;
                  case "Birthday":
                    // controller.phoneTextController.text =
                    //     controller.phone.value;
                    break;
                }
                showDialog<String>(
                  barrierColor: Colors.black87.withOpacity(0.8),
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    actionsPadding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: 4.w,
                    ),
                    titlePadding: EdgeInsets.only(top: 16.w),
                    title: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 17.sp,
                      ),
                    ),
                    content: content,
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 14.w, left: 3.w, right: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 35.w,
                                width: 90.w,
                                child: GradientButtonWidget(
                                  title: 'Cancle',
                                  function: (() => Get.back()),
                                  fontSize: 15.sp,
                                  radius: 8.r,
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: SizedBox(
                                height: 35.w,
                                width: 90.w,
                                child: GradientButtonWidget(
                                  title: 'Save',
                                  function: (() async {
                                    Get.back();
                                    controller.updateUser(title: title);
                                  }),
                                  fontSize: 15.sp,
                                  radius: 8.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Container(
                height: 45.w,
                width: 40.w,
                color: Colors.transparent,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
