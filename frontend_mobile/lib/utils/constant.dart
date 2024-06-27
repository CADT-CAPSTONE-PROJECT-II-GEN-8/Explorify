import 'package:flutter/material.dart';
import 'package:frontend_mobile/utils/config.dart';

InputDecoration formDecoration(
    {required String labelText,
    String? hintText,
    required IconData prefixIcon,
    IconData? suffixIcon,
    bool? isObsure}) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 10),
    prefixIcon: Icon(
      prefixIcon,
      color: Colors.black,
    ),
    suffixIcon: Icon(suffixIcon),
    hintText: hintText,
    errorMaxLines: 3,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    enabledBorder: Config.outlinedBorder,
    focusedBorder: Config.focusBorder,
    errorBorder: Config.errorBorder,
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}

// const enabledBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(12),
//     ),
//     borderSide: BorderSide(width: 1, color: Colors.orange));

// const focusedBorder = UnderlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(12),
//     ),
//     borderSide: BorderSide(width: 2, color: Colors.orange));

// const errorBorder = UnderlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(10),
//     ),
//     borderSide: BorderSide(width: 1, color: Colors.red));

void showSnackBar(BuildContext context, String text) {
  // Hide the current SnackBar
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    ),
  );
}
