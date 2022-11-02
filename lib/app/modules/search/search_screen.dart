import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/components/search_filter_component.dart';
import 'package:thanh_pho_bao_loc/app/components/search_header_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const SearchHeaderComponent(),
            const SizedBox(height: 10),
            SearchFilterComponent()
          ],
        ),
      ),
    );
  }
}
