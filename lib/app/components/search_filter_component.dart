import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilterComponent extends GetWidget<SearchController> {
  const SearchFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<PopupMenuEntry<String>> listPopup() {
      List<PopupMenuEntry<String>> list = [];
      for (var item in controller.listGender) {
        list.add(
          PopupMenuItem<String>(
            value: item,
            child: Text(item),
          ),
        );
      }
      return list;
    }

    return SizedBox(
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 100,
            color: Colors.red,
            child: Obx(
              () => PopupMenuButton<String>(
                // Callback that sets the selected popup menu item.
                onSelected: (String item) {
                  log((item));
                  controller.selectItem(item.toString());
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  ...listPopup(),
                ],

                child: Row(
                  children: [
                    Text(controller.selectItem.value),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),

          // Container(width: 200, color: Colors.blue),

          // Container(width: 200, color: Colors.red),
          // Container(width: 200, color: Colors.blue),
        ],
      ),
    );
  }
}
