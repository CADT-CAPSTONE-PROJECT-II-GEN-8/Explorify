import 'dart:async';

import "package:flutter/material.dart";
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/init.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/No Internet.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            RichText(
              text: const TextSpan(
                  text: "No",
                  style: TextStyle(
                      color: AppColor.error, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: " Internet Connection",
                      style: TextStyle(
                          color: AppColor.error, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
