import 'package:flutter/material.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController textEditingController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Enter OTP'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textEditingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter OTP',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text('Verify'),
        ),
      ],
    ),
  );
}
