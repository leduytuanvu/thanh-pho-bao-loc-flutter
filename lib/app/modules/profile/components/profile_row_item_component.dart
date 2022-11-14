import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
// import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_change_avatar_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_date_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_gender_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_phone_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/content_dialog_text_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class ProfileRowItemComponent extends GetWidget<ProfileController> {
  final String title;
  // final String value;
  const ProfileRowItemComponent({
    super.key,
    required this.title,
    // required this.value,
  });

  @override
  Widget build(BuildContext context) {
    var value = "";
    // log("$value VALIEJEAFDF");
    // var textController = TextEditingController();
    // textController.text = value;
    late Widget content;
    var typeTextInput = TextInputType.name;
    switch (title) {
      case "Email":
        content = ContentDialogTextComponent(
            textController: controller.textController);
        typeTextInput = TextInputType.emailAddress;
        value = controller.emailTextController.text;
        break;
      case "Phone":
        content = ContentDialogPhoneComponent(
            textController: controller.textController);
        typeTextInput = TextInputType.phone;
        value = controller.phoneTextController.text;
        break;
      case "Full name":
        content = ContentDialogTextComponent(
          textController: controller.fullNameTextController,
        );
        value = controller.fullNameTextController.text;
        typeTextInput = TextInputType.name;
        break;
      case "Birthday":
        content = ContentDialogDateComponent(
            textController: controller.textController);
        typeTextInput = TextInputType.datetime;
        break;
      case "Gender":
        content = ContentDialogGenderComponent(
            textController: controller.textController);
        typeTextInput = TextInputType.datetime;
        break;
      // case "Change avatar":
      //   content = const ContentDialogChangeAvatarComponent();
      //   typeTextInput = TextInputType.datetime;
      //   break;
      // case "Change wallpaper":
      //   content = const ContentDialogChangeAvatarComponent();
      //   typeTextInput = TextInputType.datetime;
      //   break;
    }

    return Container(
      color: Colors.grey.shade100.withOpacity(0.6),
      child: Padding(
        padding: EdgeInsets.only(
          left: 13.w,
          // right: 11.w,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15.sp,
              ),
            ),
            // const Spacer(),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 15.sp,
                ),
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // SizedBox(width: 5.w),
            GestureDetector(
              onTap: () {
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
                    // contentPadding: EdgeInsets.only(
                    //   left: 20.w,
                    //   right: 20.w,
                    //   bottom: 12.w,
                    //   top: 20.w,
                    // ),
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
