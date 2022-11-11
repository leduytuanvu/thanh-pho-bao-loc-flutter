import 'package:date_time_picker/date_time_picker.dart';

import '../../../core/utils/export.dart';

class ContentDialogDateComponent extends StatelessWidget {
  final TextEditingController textController;
  const ContentDialogDateComponent({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: DateTimePicker(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 0, bottom: 40.h),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          // hintText: "Enter new ${title.toLowerCase()}",

          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.r),
            child: const Icon(
              Icons.calendar_month,
              color: Colors.black38,
            ),
          ),
        ),
        initialValue: '',
        style: TextStyle(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          color: Colors.black87,
          fontSize: 15.sp,
        ),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        onChanged: (val) => print(val),
        validator: (val) {
          return null;
        },
        onSaved: (val) => print(val),
      ),
    );
  }
}
