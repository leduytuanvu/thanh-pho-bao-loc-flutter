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
      child: TextField(
        enableInteractiveSelection: false,
        onTap: () {},
        onChanged: ((value) {}),
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
    );
  }
}
