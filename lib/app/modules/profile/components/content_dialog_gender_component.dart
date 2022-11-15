import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';

import '../../../core/utils/export.dart';

class ContentDialogGenderComponent extends GetWidget<ProfileController> {
  final TextEditingController textController;
  const ContentDialogGenderComponent({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Colors.black87,
              style: BorderStyle.solid,
              width: 0.50,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: DropdownButton<String>(
              onTap: (() {}),
              borderRadius: BorderRadius.circular(4.r),
              value: controller.gender.value,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 0,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.sp,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              onChanged: (String? value) {
                controller.gender(value);
              },
              underline: const SizedBox.shrink(),
              items:
                  controller.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.black87,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
