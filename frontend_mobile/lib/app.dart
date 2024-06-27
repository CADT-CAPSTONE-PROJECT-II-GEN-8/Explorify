import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.onGenerateRoute,
      initialRoute: RouteManager.splashScreen,
      theme: ThemeData(
        // fontFamily: 'Inter',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColor.white,
        primaryColor: const Color.fromARGB(255, 145, 121, 102),
        secondaryHeaderColor: AppColor.secondary,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          headlineMedium: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.secondary),
          headlineSmall: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.accent),
          titleLarge: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColor.secondary,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColor.secondary,
          ),
          titleSmall: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColor.accent),
          bodyLarge: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColor.textPrimary,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: AppColor.textSecondary,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.normal,
            color: AppColor.textAccent,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(54),
            foregroundColor: AppColor.white,
            backgroundColor: AppColor.primary,
            disabledForegroundColor: AppColor.midGrey,
            disabledBackgroundColor: AppColor.midGrey,
            textStyle: GoogleFonts.inter(
                fontSize: 16,
                color: AppColor.white,
                fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
          ),
        ),
      ),
      // home: const SplashScreen(),
    );
  }
}
