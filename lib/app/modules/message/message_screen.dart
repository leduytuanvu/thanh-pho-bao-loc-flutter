import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_colors.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/profile_controller.dart';

class MessageScreen extends GetWidget<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
