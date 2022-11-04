import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanh_pho_bao_loc/app/components/gradient_button_conponent.dart';
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
    return Column(
      children: [
        SizedBox(height: 15.h),
        // EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        SizedBox(
          height: 40.h,
          child: Row(
            children: [
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
              SizedBox(width: 10.w),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where("statusAccount", isEqualTo: "active")
              .snapshots(),
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
                    log(data['image']);
                    return Column(
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SizedBox(width: 10.w),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              // child: Image(
                              //   image: NetworkImage(data['image']),
                              //   width: 55.w,
                              //   height: 55.w,
                              //   fit: BoxFit.cover,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: data['image'],
                                height: 50.w,
                                width: 50.w,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['fullName'],
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    data['email'],
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: GradientButtonWidget(
                                fontSize: 12.sp,
                                title: 'Add friend',
                                function: () {},
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        // Divider(
                        //   color: Colors.black12,
                        //   thickness: 10.h,
                        // ),
                      ],
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              } else {
                return const Center();
              }
            }
            return Container();
          },
        )
      ],
    );
  }
}
