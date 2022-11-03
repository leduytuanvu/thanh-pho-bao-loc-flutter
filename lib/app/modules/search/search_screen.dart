import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}

class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.w,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      hintText: " Search by name, email, phone number ...",
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: Colors.black26,
                      ),
                      suffixIcon: const Icon(
                        Icons.close,
                        color: Colors.black54,
                      ),
                    ),
                    cursorColor: Colors.black12,
                    cursorWidth: 1.w,
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.black87,
                    ),
                    // cursorHeight: ,
                  ),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: const [],
          )
        ],
      ),
    );
  }
}
