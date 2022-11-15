import '../../../core/utils/export.dart';

class ContentDialogPhoneComponent extends StatelessWidget {
  final TextEditingController textController;
  const ContentDialogPhoneComponent({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    controller.text = "+84";
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 45.w,
            child: TextField(
              textAlign: TextAlign.center,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  color: Colors.black26,
                ),
                prefixIconConstraints: const BoxConstraints(),
              ),
              cursorColor: Colors.black12,
              enabled: false,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.black87,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: TextField(
              enableInteractiveSelection: false,
              onTap: () {},
              onChanged: ((value) {}),
              controller: textController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
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
      ),
    );
  }
}
