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
import 'package:frontend_mobile/screens/home/widgets/section_heading.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/app_bar.dart';
import 'package:frontend_mobile/widget/custom_container.dart';
import 'package:http/retry.dart';
import 'package:filter_list/filter_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User>? selectedUserList = [];

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
                            openFilterDialog();
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

  void openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      listData: userList,
      selectedListData: selectedUserList,
      choiceChipLabel: (user) => user!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  Future<void> openFilterDelegate() async {
    await FilterListDelegate.show<User>(
      context: context,
      list: userList,
      selectedListData: selectedUserList,
      theme: FilterListDelegateThemeData(
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          tileColor: Colors.white,
          selectedTileColor: const Color(0xFF649BEC).withOpacity(.5),
        ),
        tileTextStyle: TextStyle(fontSize: 14),
      ),
      // enableOnlySingleSelection: true,
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      tileLabel: (user) => user!.name,
      emptySearchChild: const Center(child: Text('No user found')),
      // enableOnlySingleSelection: true,
      searchFieldHint: 'Search Here..',
      /*suggestionBuilder: (context, user, isSelected) {
        return ListTile(
          title: Text(user.name!),
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          selected: isSelected,
        );
      },*/
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = list;
        });
      },
    );
  }
}

class User {
  final String? name;
  final String? avatar;
  User({this.name, this.avatar});
}

List<User> userList = [
  User(name: "Abigail", avatar: "user.png"),
  User(name: "Audrey", avatar: "user.png"),
  User(name: "Ava", avatar: "user.png"),
  User(name: "Bella", avatar: "user.png"),
  User(name: "Bernadette", avatar: "user.png"),
  User(name: "Carol", avatar: "user.png"),
  User(name: "Claire", avatar: "user.png"),
  User(name: "Deirdre", avatar: "user.png"),
  User(name: "Donna", avatar: "user.png"),
  User(name: "Dorothy", avatar: "user.png"),
  User(name: "Faith", avatar: "user.png"),
  User(name: "Gabrielle", avatar: "user.png"),
  User(name: "Grace", avatar: "user.png"),
  User(name: "Hannah", avatar: "user.png"),
  User(name: "Heather", avatar: "user.png"),
  User(name: "Irene", avatar: "user.png"),
  User(name: "Jan", avatar: "user.png"),
  User(name: "Jane", avatar: "user.png"),
  User(name: "Julia", avatar: "user.png"),
  User(name: "Kylie", avatar: "user.png"),
  User(name: "Lauren", avatar: "user.png"),
  User(name: "Leah", avatar: "user.png"),
  User(name: "Lisa", avatar: "user.png"),
  User(name: "Melanie", avatar: "user.png"),
  User(name: "Natalie", avatar: "user.png"),
  User(name: "Olivia", avatar: "user.png"),
  User(name: "Penelope", avatar: "user.png"),
  User(name: "Rachel", avatar: "user.png"),
  User(name: "Ruth", avatar: "user.png"),
  User(name: "Sally", avatar: "user.png"),
  User(name: "Samantha", avatar: "user.png"),
  User(name: "Sarah", avatar: "user.png"),
];
