import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

import '../../../core/utils/export.dart';

class ProfileRowItemComponent extends GetWidget<ProfileController> {
  final String title;
  final String value;
  const ProfileRowItemComponent({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // controller.textController.text = value;
    // log("$value value nef");
    var textController = TextEditingController();
    textController.text = value;
    var typeTextInput = TextInputType.name;
    switch (title) {
      case "Email":
        typeTextInput = TextInputType.emailAddress;
        break;
      case "Phone":
        typeTextInput = TextInputType.phone;
        break;
      case "Full name":
        typeTextInput = TextInputType.name;
        break;
      case "Birthday":
        typeTextInput = TextInputType.datetime;
        break;
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
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    actionsPadding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: 4.w,
                      top: 2.w,
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
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,

                      child: TextField(
                        onTap: () {
                          // controller.textController.selection =
                          //     TextSelection.collapsed(
                          //   offset: controller.textController.text.length,
                          // );
                        },
                        // autofocus: true,
                        onChanged: ((value) {
                          // controller.textController.text = value;
                        }),
                        // controller: controller.textController..text = value,
                        controller: textController,

                        keyboardType: typeTextInput,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.w),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          // hintText: "Enter new ${title.toLowerCase()}",
                          hintStyle: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: Colors.black26,
                          ),
                          prefixIconConstraints: const BoxConstraints(),
                        ),
                        cursorColor: Colors.black12,
                        cursorWidth: 0.6.w,
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          color: Colors.black87,
                          fontSize: 14.sp,
                        ),
                        // cursorHeight: ,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: 12.w,
                      top: 18.w,
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 14.w),
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
                                    await controller.signOut();
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
