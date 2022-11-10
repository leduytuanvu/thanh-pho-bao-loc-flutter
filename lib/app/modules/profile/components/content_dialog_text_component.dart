import '../../../core/utils/export.dart';

class ContentDialogTextComponent extends StatelessWidget {
  final TextEditingController textController;
  const ContentDialogTextComponent({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          // alignLabelWithHint: true,
          // floatingLabelAlignment: FloatingLabelAlignment.center,

          // prefixIcon: widget.title == "Phone"
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //           left: 15.w,
          //           right: 6.w,
          //           bottom: 1.w,
          //         ),
          //         child: Text(
          //           '+84  |',
          //           style: TextStyle(
          //             fontFamily: GoogleFonts.montserrat().fontFamily,
          //             color: Colors.black87,
          //             fontSize: 15.sp,
          //           ),
          //         ),
          //       )
          //     : null,
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
    );
  }
}
