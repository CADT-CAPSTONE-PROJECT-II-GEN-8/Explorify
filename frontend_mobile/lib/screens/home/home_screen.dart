import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/home/job_detail_screen.dart';
import 'package:frontend_mobile/screens/home/widgets/category.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_card.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_notification.dart';
import 'package:frontend_mobile/screens/home/widgets/home_appBar.dart';
import 'package:frontend_mobile/screens/home/widgets/search_bar.dart';
import 'package:frontend_mobile/screens/home/widgets/section_header_categories.dart';
import 'package:frontend_mobile/screens/home/widgets/section_heading.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/app_bar.dart';
import 'package:frontend_mobile/widget/custom_container.dart';
import 'package:http/retry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey.withOpacity(.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header AppBar
            PrimaryCustomContainer(
              child: Column(
                children: [
                  // -- APPBAR --
                  const HomeAppBar(),
                  Config.spaceMedium,
                  // -- Search --
                  // SearchContainer(
                  //   text: AppText.enText['search-text']!,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor.white,
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search ...',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust as desired
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            width:
                                10.0), // Spacing between search field and button
                        IconButton(
                          icon: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                                color: AppColor.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: const Icon(Icons.filter_list_rounded),
                          ), // Change the icon if needed
                          onPressed: () {
                            // To Do: Navigate to Filter
                            // openFilterDelegate();
                            FilterOverLay(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            //-- Body --
            // --CATEGORY--
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  SectionHeading(title: AppText.enText['findjob-text']!),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 118,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const VerticleImage(
                            title: 'Title',
                            subTitle: '11 Jobs',
                            image: AppImage.logo,
                          );
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            // -- LIST OF JOB --
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SectionHeading(
                    title: AppText.enText['recommended-text']!,
                    showActionButton: true,
                  ),
                  // ListView.builder(itemBuilder: (context, index) {
                  //   return FutureBuilder(
                  //       future: this._fetchJob(index),
                  //       builder: (context, snapshot) {
                  //         switch (snapshot.connectionState) {
                  //           case ConnectionState.none:
                  //           // TODO: Handle this case.
                  //           case ConnectionState.waiting:
                  //             // TODO: Handle this case.
                  //             return CircularProgressIndicator();
                  //           case ConnectionState.active:
                  //             return CircularProgressIndicator();
                  //           // TODO: Handle this case.
                  //           case ConnectionState.done:
                  //             // TODO: Handle this case.
                  //             if (snapshot.hasError) {
                  //               return Text('Error: ${snapshot.error}');
                  //             } else {
                  //               var productInfo = snapshot.data;
                  //               return ListTile(
                  //                 leading: Icon(Icons.shopping_cart),
                  //                 title: Text(productInfo!['name']),
                  //                 subtitle:
                  //                     Text('price: ${productInfo['price']}USD'),
                  //               );
                  //             }
                  //         }
                  //       });
                  // })
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomCardInfo(
                          jobImage: AppImage.google,
                          jobType: "Full Time",
                          companyName: "Google Inc",
                          positionName: "UX/UI Designer",
                          location: "California, USA",
                          minSalary: 200,
                          maxSalry: 400,
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.jobDetailScreen);
                          },
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> FilterOverLay(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.grey,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search ...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust as desired
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10.0), // Spacing between search field and button
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            color: AppColor.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: const Icon(Icons.close_rounded),
                      ), // Change the icon if needed
                      onPressed: () {
                        // To Do: Navigate to Filter
                        // openFilterDelegate();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const SectionHeadingCategory(
                  title: 'Intern Type:',
                  buttonIcon: Icons.cases_rounded,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
