import 'package:clean_architecture/utils/constants/colors.dart';
import 'package:clean_architecture/utils/device/devices.dart';
import 'package:flutter/material.dart';

Widget elevatedButton(
    {required String text,
    required BuildContext context,
    required VoidCallback onTap}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(getWidth(context), 55),
        ),
        backgroundColor: const MaterialStatePropertyAll(FColors.primaryColor),
        foregroundColor: const MaterialStatePropertyAll(Colors.white)),
    child: Text(text),
  );
}
