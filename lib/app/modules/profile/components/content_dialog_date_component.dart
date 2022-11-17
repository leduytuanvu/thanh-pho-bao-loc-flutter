import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/controller/profile_controller.dart';
import '../../../core/utils/export.dart';

class ContentDialogDateComponent extends GetWidget<ProfileController> {
  const ContentDialogDateComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // DateTime birthday =
    //     DateFormat("dd-MM-yyyy").parse(controller.birthday.value);
    // var controller = TextEditingController();
    // log(birthday.toString());
    // log(birthday.toIso8601String());
    // log('=====================================================');
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: DateTimePicker(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 0, bottom: 0.h),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          hintText: "Choose date",
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.r),
            child: const Icon(
              Icons.calendar_month,
              color: Colors.black38,
            ),
          ),
        ),
        initialValue: controller.birthday.value != ""
            ? DateFormat("dd-MM-yyyy")
                .parse(controller.birthday.value)
                .toIso8601String()
            : null,
        // initialValue: birthday.toIso8601String(),
        style: TextStyle(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          color: Colors.black87,
          fontSize: 15.sp,
        ),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        onChanged: (val) => {
          // log("${birthday.toIso8601String()} BEFORE"),
          // log("${controller.birthday.value} BEFORE"),
          // log(DateFormat("dd-MM-yyyy")
          //     .parse(controller.birthday.value)
          //     .toIso8601String()),
          log(val),
          controller.birthdayTmp(val),
          // log(controller.birthday.value),
          // log("==============================================="),
          // log("${birthday.toIso8601String()} AFTER"),
        },
        validator: (val) {
          return null;
        },
        onSaved: (val) => {},
      ),
    );
  }
}
