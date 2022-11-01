import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/search_controller.dart';

class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          color: Colors.red,
          child: Column(children: [
            Text('SEARCH'),
          ]),
        ),
      ),
    );
  }
}
