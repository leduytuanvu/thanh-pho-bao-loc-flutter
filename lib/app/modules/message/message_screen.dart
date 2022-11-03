import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/modules/message/message_controller.dart';

class MessageScreen extends GetWidget<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          color: Colors.red,
          child: Column(children: const [
            Text('MESSAGE'),
          ]),
        ),
      ),
    );
  }
}
