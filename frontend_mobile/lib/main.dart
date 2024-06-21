import 'package:flutter/material.dart';
import 'package:frontend_mobile/app.dart';
import 'package:frontend_mobile/provider/apply.dart';
import 'package:frontend_mobile/provider/user_provider.dart';
import 'package:frontend_mobile/screens/login/logic/otp_logic.dart';
import 'package:frontend_mobile/screens/login/logic/user_input_logic.dart';
import 'package:frontend_mobile/widget/navigation_menu.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UploadState>(
              create: (context) => UploadState()),
          ChangeNotifierProvider<NavigationProvider>(
              create: (context) => NavigationProvider()),
          ChangeNotifierProvider(create: (context) => OtpProvider()),
          ChangeNotifierProvider(create: (context) => UserInputLogic()),
          ChangeNotifierProvider(create: (context) => UserProvider())
        ],
        child: const MyApp(),
      ),
    );
