import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/profile/widget/account_listing.dart';
import 'package:frontend_mobile/screens/profile/widget/custome_listing.dart';
import 'package:frontend_mobile/screens/profile/widget/profile_appBar.dart';
import 'package:frontend_mobile/utils/config.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header AppBar
            const PrimaryCustomContainer(
              child: Column(
                children: [
                  // -- APPBAR --
                  ProfileAppBar(),
                  Config.spaceMedium,
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    color: AppColor.white,
                    child: Column(
                      children: [
                        ProfileInfoBox(
                          icon: Icons.person,
                          title: 'About me',
                          subTitle:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.aboutMeScreen);
                          },
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Work experience',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.workExperinceScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Education',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.eduInfoScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        CustomeListing(
                          icon: Icons.person,
                          title: 'Skill',
                          subTitle:
                              'Leadership Teamwork Visioner Target oriented Consistent',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.skillScreen);
                          },
                        ),
                        SizedBox(height: 30.0),
                        CustomeListing(
                          icon: Icons.language_outlined,
                          title: 'Language',
                          subTitle: 'English Koren Khmer Chinese',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.languageMainScreen);
                          },
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.book_online_outlined,
                          title: 'Appreciation',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.appreciationScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Resume',
                          onTrailingTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.languageMainScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
