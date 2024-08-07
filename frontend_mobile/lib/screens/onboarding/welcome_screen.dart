import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/no_internet.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/login/services/token_service.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/navigation_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  TokenService tokenService = TokenService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: tokenService.getAccessToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
              // Loading indicator
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const NoInternetScreen(); // Handle error
          } else if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.welcomeImg,
                      width: 250,
                    ),
                    Config.spaceLarge,
                    Text(
                      AppText.enText['welcome-title']!,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    Config.spaceSmall,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: AppText.enText['welcome-body']!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w300),
                          children: [
                            TextSpan(
                                text: " Explorify",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Config.spaceLarge,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteManager.preferenceScreen);
                      },
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: Text(AppText.enText['welcome-button']!),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData) {
            const NavigationMenu();
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.welcomeImg,
                    width: 250,
                  ),
                  Config.spaceLarge,
                  Text(
                    AppText.enText['welcome-title']!,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  Config.spaceSmall,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: AppText.enText['welcome-body']!,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: " Explorify",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Config.spaceLarge,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteManager.preferenceScreen);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(AppText.enText['welcome-button']!),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
