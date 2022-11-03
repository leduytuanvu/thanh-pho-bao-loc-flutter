import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
          // ListView(
          //   shrinkWrap: true,
          //   children: const [],
          // ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data =
                          snapshot.data!.docs[index].data();
                      return Column(
                        children: [
                          Text(data['id']),
                          // Text(snapshot.data!.docs[index]["fullName"]),
                          // Text(data['fullName']),
                          Text(data['email']),
                          Text(data['image']),
                          Text(data['status']),
                          Text(data['statusAccount']),
                          Text(data['fullName']),
                        ],
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                } else {
                  return Center();
                }
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
