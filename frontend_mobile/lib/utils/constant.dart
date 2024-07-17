import 'package:flutter/material.dart';
import 'package:frontend_mobile/provider/obsure_text_provider.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:provider/provider.dart';

InputDecoration formDecoration({
  required BuildContext context,
  required String labelText,
  String? hintText,
  required IconData prefixIcon,
  required bool suffixIcon,
}) {
  final isObscureProvider = Provider.of<IsObscureProvider>(context);

  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 10),
    prefixIcon: Icon(
      prefixIcon,
      color: Colors.black,
    ),
    suffixIcon: suffixIcon
        ? IconButton(
            onPressed: () {
              isObscureProvider.toggleObscure();
            },
            icon: Icon(
              isObscureProvider.isObscure
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          )
        : null,
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
