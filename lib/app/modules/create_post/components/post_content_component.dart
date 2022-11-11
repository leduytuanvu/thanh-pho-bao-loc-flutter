import '../../../core/utils/export.dart';

class PostContentComponent extends StatelessWidget {
  const PostContentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        maxLines: 20,

        enableInteractiveSelection: false,
        onTap: () {},
        onChanged: ((value) {}),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: "What are you thinking ?",
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
    );
  }
}
