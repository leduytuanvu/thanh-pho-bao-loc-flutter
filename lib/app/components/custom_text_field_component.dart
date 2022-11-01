import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool? obscureText;
  final Function()? function;
  final IconData? icon;
  const CustomTextFieldWidget({
    Key? key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.w, right: 2.w),
        child: TextField(
          obscureText: widget.obscureText!,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 15.sp,
              color: Colors.black12,
            ),
            border: InputBorder.none,
            hintText: ' ${widget.hint}',
            suffixIcon: GestureDetector(
              onTap: widget.function,
              child: Container(
                color: Colors.transparent,
                child: Icon(
                  widget.icon,
                  size: 20.sp,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 15.sp,
            color: Colors.black87,
          ),
          cursorColor: Colors.black26,
          cursorWidth: 1.w,
          cursorHeight: 15.h,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
