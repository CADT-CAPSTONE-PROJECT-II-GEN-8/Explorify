import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/screens/home/services/cv_generate_service.dart';
import 'package:frontend_mobile/screens/profile/widget/account_listing.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';
import 'package:frontend_mobile/screens/profile/widget/custome_listing.dart';
import 'package:intl/intl.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  CV cvInfo = CV(
      cvId: 0,
      description: 'none',
      jobTitle: 'none',
      userAward: [],
      userEducation: [],
      userLanguage: [],
      userMajor: [],
      userSkill: [],
      userCompany: [],
      reference: 'none');
  late final CvGenerateService cvServicecs = CvGenerateService();

  @override
  void initState() {
    super.initState();
    fetchCVInfo();
  }

  fetchCVInfo() async {
    cvInfo = await cvServicecs.getCV(context);
  }

  Future<void> _handleRefresh() async {
    await fetchCVInfo();
    if (context.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: AppColor.primary,
        child: FutureBuilder<dynamic>(
            future: fetchCVInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator()); // Loading indicator
              }

              // Define a DateFormat
              final dateFormat =
                  DateFormat('dd MMM yyyy'); // You can customize the format

              // Format the startDate and endDate
              String formattedStartDate =
                  dateFormat.format(cvInfo.userCompany!.last.startDate);
              String formattedEndDate =
                  dateFormat.format(cvInfo.userCompany!.last.endDate);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AppImage.upperStyle),
                    // Header AppBar
                    const CustomAccountAppBar(
                      showBackArrow: true,
                      leadingIconColor: Colors.black,
                      title: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Text(
                              "Account Detail",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
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
                                      ' I am defined as ${cvInfo.description}'
                                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
                                  ,
                                  onTrailingTap: () {
                                    Navigator.pushNamed(
                                        context, RouteManager.aboutMeScreen);
                                  },
                                ),
                                const SizedBox(height: 30.0),
                                ProfileInfoBox(
                                  icon: Icons.work,
                                  title: 'Work experience',
                                  onTrailingTap: () {
                                    Navigator.pushNamed(context,
                                        RouteManager.workExperinceScreen);
                                  },
                                  subTitle: cvInfo.userCompany != null
                                      ? 'I have been working at ${cvInfo.userCompany!.last.companyName} as ${cvInfo.userCompany!.last.position} from $formattedStartDate unitl $formattedEndDate with experience of ${cvInfo.userCompany!.last.description}'
                                      : 'none',
                                ),
                                const SizedBox(height: 30.0),
                                // Column(
                                //   children:
                                //       cvInfo.userEducation!.map((education) {
                                //     return ProfileInfoBox(
                                //       icon: Icons.work,
                                //       title: 'Education',
                                //       onTrailingTap: () {
                                //         Navigator.pushNamed(context,
                                //             RouteManager.eduInfoScreen);
                                //       },
                                //       subTitle:
                                //           'Graduated from ${education.school} with level of ${education.educationLevel}', // Use the current item in the map
                                //     );
                                //   }).toList(), // Ensure the result is converted to a list
                                // ),
                                ProfileInfoBox(
                                  icon: Icons.work,
                                  title: 'Education',
                                  onTrailingTap: () {
                                    Navigator.pushNamed(
                                        context, RouteManager.eduInfoScreen);
                                  },
                                  subTitle:
                                      'Graduated from ${cvInfo.userEducation!.last.school} with level of ${cvInfo.userEducation!.last.educationLevel}', // Use the current item in the map
                                ),
                                const SizedBox(height: 30.0),
                                CustomeListing(
                                  icon: Icons.person,
                                  title: 'Skill',
                                  subTitle:
                                      'Leadership Teamwork Visioner Target oriented Consistent',
                                  onTrailingTap: () {
                                    Navigator.pushNamed(
                                        context, RouteManager.skillScreen);
                                  },
                                ),
                                const SizedBox(height: 30.0),
                                CustomeListing(
                                  icon: Icons.language_outlined,
                                  title: 'Language',
                                  subTitle: 'English Koren Khmer Chinese',
                                  onTrailingTap: () {
                                    Navigator.pushNamed(context,
                                        RouteManager.languageMainScreen);
                                  },
                                ),
                                const SizedBox(height: 30.0),
                                ProfileInfoBox(
                                  icon: Icons.book_online_outlined,
                                  title: 'Appreciation',
                                  onTrailingTap: () {
                                    Navigator.pushNamed(context,
                                        RouteManager.appreciationScreen);
                                  },
                                  subTitle: cvInfo.reference,
                                ),
                                const SizedBox(height: 30.0),
                                ProfileInfoBox(
                                  icon: Icons.work,
                                  title: 'Resume',
                                  onTrailingTap: () {
                                    Navigator.pushNamed(context,
                                        RouteManager.languageMainScreen);
                                  },
                                  subTitle: cvInfo.description,
                                ),
                                const SizedBox(
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
              );
            }),
      ),
    );
  }
}
