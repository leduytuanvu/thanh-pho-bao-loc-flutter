import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // const ProfileHeaderComponent(),
          // const ProfileBodyComponent(),
          const SizedBox(height: 10),
          GestureDetector(
            child: Container(
              height: 400,
              color: Colors.red,
            ),
          ),
          Container(
            height: 400,
            color: Colors.blue,
          ),
          Container(
            height: 400,
            color: Colors.green,
          ),
          Container(
            height: 400,
            color: Colors.red,
          ),
          Container(
            height: 400,
            color: Colors.blue,
          ),
          Container(
            height: 400,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
