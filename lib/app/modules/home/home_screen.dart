import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.signOut(context: context);
                log('đấ');
              },
              child: Container(
                height: 30,
                width: 30,
                color: Colors.pink,
              ),
            ),
            Text('HOME'),
          ],
        ),
      ),
    );
  }
}
