import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class Item {
  Item({
    required this.headerText,
    required this.expandedText,
    this.isExpanded = false,
  });

  String headerText;
  String expandedText;
  bool isExpanded;
}

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<Item> _data = [
    Item(
      headerText: 'Introduction',
      expandedText: 'This is the introduction section.',
    ),
    Item(
      headerText: 'Chapter 1: Getting Started',
      expandedText: 'This is Chapter 1.',
    ),
    Item(
      headerText: 'Chapter 2: Basic Concepts',
      expandedText: 'This is Chapter 2.',
    ),
    Item(
      headerText: 'Chapter 3: Advanced Techniques',
      expandedText: 'This is Chapter 3.',
    ),
    Item(
      headerText: 'Chapter 4: Best Practices',
      expandedText: 'This is Chapter 4.',
    ),
    Item(
      headerText: 'Chapter 5: Troubleshooting',
      expandedText: 'This is Chapter 5.',
    ),
    Item(
      headerText: 'Chapter 6: FAQ',
      expandedText: 'This is the FAQ section.',
    ),
    Item(
      headerText: 'Conclusion',
      expandedText: 'This is the conclusion section.',
    ),
    Item(
      headerText: 'Appendix A',
      expandedText: 'This is Appendix A.',
    ),
    Item(
      headerText: 'Appendix B',
      expandedText: 'This is Appendix B.',
    ),
  ];

  final List<Item> _data1 = [
    Item(
      headerText: 'Introduction',
      expandedText:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium dolorem',
    ),
    Item(
      headerText: 'Chapter 1: Getting Started',
      expandedText:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium dolorem',
    ),
    Item(
      headerText: 'Chapter 2: Basic Concepts',
      expandedText: 'This is Chapter 2.',
    ),
    Item(
      headerText: 'Chapter 3: Advanced Techniques',
      expandedText: 'This is Chapter 3.',
    ),
  ];

  final List<Item> _data2 = [
    Item(
      headerText: 'Chapter 4: Best Practices',
      expandedText: 'This is Chapter 4.',
    ),
    Item(
      headerText: 'Chapter 5: Troubleshooting',
      expandedText: 'This is Chapter 5.',
    ),
    Item(
      headerText: 'Chapter 6: FAQ',
      expandedText: 'This is the FAQ section.',
    ),
  ];

  final List<Item> _data3 = [
    Item(
      headerText: 'Conclusion',
      expandedText: 'This is the conclusion section.',
    ),
    Item(
      headerText: 'Appendix A',
      expandedText: 'This is Appendix A.',
    ),
    Item(
      headerText: 'Appendix B',
      expandedText: 'This is Appendix B.',
    ),
  ];

  final List<String> buttonTitles = [
    "General",
    "Login",
    "Account",
    "Tips ",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Image.asset(AppImage.upperStyle),
        const Column(
          children: [
            CustomAccountAppBar(
              showBackArrow: true,
              leadingIconColor: Colors.black,
              title: Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Terms and Conditions",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _buildMenuBar(),
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: [
              _buildFAQ1(),
              _buildFAQ2(),
              _buildFAQ3(),
              _buildFAQ4(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuBar() {
    return Container(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttonTitles.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: isSelected ? AppColor.primary : Colors.white,
                      border: Border.all(
                        color: AppColor.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        buttonTitles[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColor.primary,
                          fontSize: 16,
                          //fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFAQ1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _data.map((Item item) {
          return Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: item.isExpanded ? AppColor.primary : Colors.grey,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ExpansionPanelList.radio(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    item.isExpanded = !isExpanded;
                  });
                },
                initialOpenPanelValue: 0,
                children: [
                  ExpansionPanelRadio(
                    value: item.headerText,
                    backgroundColor: Colors.white,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          item.headerText,
                          style: TextStyle(
                            //fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        iconColor: Colors.amber,
                      );
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            title: Text(
                              item.expandedText,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFAQ2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _data1.map((Item item) {
          return Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: item.isExpanded ? AppColor.primary : Colors.grey,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ExpansionPanelList.radio(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    item.isExpanded = !isExpanded;
                  });
                },
                initialOpenPanelValue: 0,
                children: [
                  ExpansionPanelRadio(
                    value: item.headerText,
                    backgroundColor: Colors.white,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          item.headerText,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        iconColor: AppColor.primary,
                      );
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            title: Text(
                              item.expandedText,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFAQ3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _data2.map((Item item) {
          return Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: item.isExpanded ? AppColor.primary : Colors.grey,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ExpansionPanelList.radio(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    item.isExpanded = !isExpanded;
                  });
                },
                initialOpenPanelValue: 0,
                children: [
                  ExpansionPanelRadio(
                    value: item.headerText,
                    backgroundColor: Colors.white,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          item.headerText,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        iconColor: AppColor.primary,
                      );
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            title: Text(
                              item.expandedText,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFAQ4() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _data3.map((Item item) {
          return Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: item.isExpanded ? AppColor.primary : Colors.grey,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ExpansionPanelList.radio(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    item.isExpanded = !isExpanded;
                  });
                },
                initialOpenPanelValue: 0,
                children: [
                  ExpansionPanelRadio(
                    value: item.headerText,
                    backgroundColor: Colors.white,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          item.headerText,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        iconColor: AppColor.primary,
                      );
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            title: Text(
                              item.expandedText,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
