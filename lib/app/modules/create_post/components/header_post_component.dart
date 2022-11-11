import 'package:image_picker/image_picker.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/controller/create_post_controller.dart';

import '../../../core/utils/export.dart';

class HeaderPostComponent extends GetWidget<CreatePostController> {
  const HeaderPostComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(100.r),
          ),
          child: Image.asset(
            "assets/images/demo.png",
            height: 50.w,
            width: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Le Duy Tuan Vu',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 14.sp,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    width: 58.w,
                    height: 22.h,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: DropdownButton<String>(
                          onTap: (() {}),
                          borderRadius: BorderRadius.circular(4.r),
                          value: controller.dropdownValue.value,
                          isExpanded: true,
                          icon: Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 14.sp,
                            ),
                          ),
                          elevation: 0,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                          onChanged: (String? value) {
                            controller.dropdownValue(value);
                          },
                          underline: const SizedBox.shrink(),
                          items: controller.list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  width: 58.w,
                  height: 22.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.onImageButtonPressed(ImageSource.gallery,
                            context: context);
                      },
                      child: Text(
                        'Picture',
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          color: Colors.black87,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
