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
                    // insetPadding: EdgeInsets.zero,
                    // contentPadding: EdgeInsets.zero,
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: Text(
                        'Please enter new ${title.toLowerCase()}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,

                      child: TextField(
                        onTap: () {
                          controller.textController.selection =
                              TextSelection.collapsed(
                            offset: controller.textController.text.length,
                          );
                        },
                        // autofocus: true,
                        onChanged: ((value) {
                          // controller.textController.text = value;
                        }),
                        controller: value == ""
                            ? controller.textController
                            : controller.textController
                          ..text = value,

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
                          fontSize: 16.sp,
                        ),
                        // cursorHeight: ,
                      ),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35.w,
                              width: 90.w,
                              child: GradientButtonWidget(
                                title: 'Cancle',
                                function: (() => Get.back()),
                                fontSize: 15.sp,
                                radius: 8.r,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
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
