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
    return Column(
      children: [
        DateTimePicker(
          textAlign: TextAlign.center,
          initialValue: '',
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          onChanged: (val) => print(val),
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,

          child: TextField(
            onTap: () async {},
            // autofocus: true,
            onChanged: ((value) {}),
            // controller: controller.textController..text = value,
            controller: textController,

            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
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
              fontSize: 15.sp,
            ),
            // cursorHeight: ,
          ),
        ),
      ],
    );
  }
}
