import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';
import 'package:frontend_mobile/model/internship/company_profile.dart';
import 'package:frontend_mobile/model/internship/internship_posting.dart';
import 'package:frontend_mobile/model/internship/tag_model.dart';
import 'package:frontend_mobile/provider/company_info_provider.dart';
import 'package:frontend_mobile/provider/job_detail_provider.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/home/services/internship_service.dart';
import 'package:frontend_mobile/screens/home/widgets/category.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_card.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/home/widgets/home_appBar.dart';
import 'package:frontend_mobile/screens/home/widgets/section_header_categories.dart';
import 'package:frontend_mobile/screens/home/widgets/section_heading.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, List<String>> selectedOptions = {}; // State variable

  final List<Internship> internshipList = [
    Internship(
      internshipPostId: 01,
      jobTitle: 'UX/UI Designer',
      location: 'Cambodia, Phnom Penh',
      status: 'Active',
      jobDescription:
          'responsible for creating user-centered designs for digital products, such as websites, mobile apps, and software interfaces. Their primary focus is on enhancing user satisfaction and usability by improving the accessibility, efficiency, and aesthetics of the product.',
      jobDuration: "3 Months",
      jobRequirement:
          'Bachelor\'s degree in Graphic Design, Interaction Design, Human-Computer Interaction, or related field., Proven experience as a UI/UX Designer or similar role, with a strong portfolio showcasing your design projects., Proficiency in design tools such as Adobe XD/ Sketc/ Figma, Solid understanding of user-centered design principles and best practices. ',
      jobType: 'Full-Time',
      qualification: 'Bachelor\'s Degree',
      salary: '100\$ - 200\$',
      active: true,
      deadline: DateTime(2024, 6, 30),
      user: User(
        username: 'Linh',
      ),
      tags: [Tag(id: 1, name: 'Money')],
    ),
    Internship(
      internshipPostId: 2,
      jobTitle: 'Content Marketing Intern',
      location: 'Thailand, Bangkok',
      status: 'Active',
      jobDescription:
          'Create and manage engaging content for social media, website, and blog. Assist with content marketing campaigns.',
      jobDuration: "4 Months",
      jobRequirement:
          'Excellent written and verbal communication skills., Strong understanding of SEO principles., Experience with social media marketing platforms., Proficiency in content creation tools.',
      jobType: 'Part-Time',
      qualification: 'Bachelor\'s Degree (Preferred)',
      salary: '50\$ - 100\$',
      active: true,
      deadline: DateTime(2024, 7, 15),
      user: User(
        username: 'Linh',
      ),
      tags: [Tag(id: 1, name: 'Money')],
    ),
    Internship(
      internshipPostId: 3,
      jobTitle: 'Digital Marketing Analyst',
      location: 'Vietnam, Hanoi',
      status: 'Active',
      jobDescription:
          'Analyze marketing data to identify trends and measure campaign performance. Develop and implement digital marketing strategies.',
      jobDuration: "5 Months",
      jobRequirement:
          'Bachelor\'s degree in Marketing or related field., Experience with web analytics tools., Knowledge of digital marketing channels., Strong analytical and problem-solving skills.',
      jobType: 'Intern',
      qualification: 'Bachelor\'s Degree',
      salary: 'Unpaid',
      active: true,
      deadline: DateTime(2024, 7, 7),
      user: User(
        username: 'Linh',
      ),
      tags: [Tag(id: 1, name: 'Money')],
    ),
    Internship(
      internshipPostId: 4,
      jobTitle: 'Graphic Designer',
      location: 'Singapore',
      status: 'Active',
      jobDescription:
          'Create visually appealing graphics for marketing materials, presentations, and social media.',
      jobDuration: "3 Months",
      jobRequirement:
          'Bachelor\'s degree in Graphic Design or related field., Strong portfolio showcasing design skills., Proficiency in design software such as Adobe Photoshop Illustrator and InDesign.',
      jobType: 'Full-Time',
      qualification: 'Bachelor\'s Degree',
      salary: '120\$ - 200\$',
      active: true,
      deadline: DateTime(2024, 7, 10),
      user: User(
        username: 'Linh',
      ),
      tags: [Tag(id: 1, name: 'Money')],
    ),
    Internship(
      internshipPostId: 5,
      jobTitle: 'Digital Business Intern',
      location: 'Indonesia, Jakarta',
      status: 'Active',
      jobDescription:
          'Identify and develop new business opportunities. Conduct market research and competitor analysis. Prepare presentations and proposals.',
      jobDuration: "6 Months",
      jobRequirement:
          'Bachelor\'s degree in Business Administration or related field., Strong communication and interpersonal skills., Experience with business development activities (a plus).',
      jobType: 'Intern',
      qualification: 'Bachelor\'s Degree (In Progress)',
      salary: '75\$ - 125',
      active: true,
      deadline: DateTime(2024, 7, 1),
      user: User(
        username: 'Linh',
      ),
      tags: [Tag(id: 1, name: 'Money')],
    ),
  ];

  final List<CompanyProfile> companyList = [
    CompanyProfile(
      companyPic: AppImage.google,
      companyId: 0,
      companyName: "Google Inc",
      description: "Giant tech company",
      location: "Canada, USA",
    ),
    CompanyProfile(
      companyPic: AppImage.facebook,
      companyId: 1,
      companyName: "Meta Platforms Inc.",
      description: "Social media and technology company",
      location: "USA",
    ),
  ];
  InternshipService internshipService = InternshipService();
  List<Internship> internshipData = [];
  @override
  void initState() {
    super.initState();
  }

  // getInternship() async {
  //   internshipData = await internshipService.getInternshipDetials(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey.withOpacity(.4),
      body: FutureBuilder<List<dynamic>>(
          future: internshipService.getInternshipDetials(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child:
                                        const Icon(Icons.filter_list_rounded),
                                  ), // Change the icon if needed
                                  onPressed: () {
                                    // To Do: Navigate to Filter
                                    // openFilterDelegate();
                                    FilterOverLay(
                                      context,
                                      (Map<String, List<String>>
                                          updatedOptions) {
                                        // Callback function to update parent state
                                        setState(() {
                                          selectedOptions =
                                              updatedOptions; // Update your state variable with selections
                                        });
                                      },
                                    );
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
                          SectionHeading(
                              title: AppText.enText['findjob-text']!),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 118,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final internshipInfo = snapshot.data![index];
                                  return VerticleImage(
                                    internship: internshipInfo,
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
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final internshipInfo = snapshot.data![index];
                                final companyInfo = companyList[index];
                                double minSalary;
                                double maxSalary;

                                if (internshipInfo.salary
                                        .trim()
                                        .toLowerCase() ==
                                    "unpaid") {
                                  // Handle unpaid case (set minSalary to 0 or a specific value)
                                  minSalary =
                                      0; // Assuming unpaid means no salary
                                  maxSalary = 0;
                                } else {
                                  List<String> salaryParts =
                                      internshipInfo.salary.split('-');
                                  minSalary =
                                      double.parse(salaryParts[0].trim());
                                  maxSalary =
                                      double.parse(salaryParts[1].trim());
                                }
                                return CustomCardInfo(
                                  jobImage: companyInfo.companyPic,
                                  jobType: internshipInfo.jobType,
                                  companyName: companyInfo.companyName,
                                  positionName: internshipInfo.jobTitle,
                                  location: companyInfo.location,
                                  minSalary: minSalary,
                                  maxSalry: maxSalary,
                                  onTap: () {
                                    Provider.of<InternshipProvider>(context,
                                            listen: false)
                                        .internshipInfo = internshipInfo;
                                    Provider.of<CompanyProfileProvider>(context,
                                            listen: false)
                                        .companyProfile = companyInfo;
                                    Navigator.pushNamed(
                                        context, RouteManager.jobDetailScreen);
                                  },
                                );
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data'));
            }
          }),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> FilterOverLay(BuildContext context,
      Function(Map<String, List<String>>) onSelectOptions) {
    Map<String, List<String>> selectedOptions = {};
    bool isSelected = false;

    final List<Map<String, dynamic>> filterCategories = [
      {
        "title": "Intern Type:",
        "icon": AppImage.briefcaseImg,
        "options": ["Intern", "Full-time", "Part-time"],
      },
      {
        "title": "Location:",
        "icon": AppImage.locationImg,
        "options": ["San Francisco", "New York", "Remote"],
      },
      {
        "title": "Education:",
        "icon": AppImage.educationImg,
        "options": ["San Francisco", "New York", "Remote"],
      },
      {
        "title": "Field of Interest:",
        "icon": AppImage.interestFieldImg,
        "options": ["San Francisco", "New York", "Remote"],
      },
    ];

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
            child: Column(children: [
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
                          borderRadius:
                              BorderRadius.circular(12.0), // Adjust as desired
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
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
              // const SizedBox(
              //   height: 12,
              // ),
              // const SectionHeadingCategory(
              //   title: 'Intern Type:',
              //   buttonIcon: Icons.cases_rounded,
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: filterCategories.length,
                  itemBuilder: (context, index) {
                    final category = filterCategories[index];
                    final options = category["options"] as List<String>;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeadingCategory(
                          title: category['title'],
                          buttonIcon: category['icon'],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          spacing: 8,
                          children: options.map<Widget>((option) {
                            // Check if option is a String
                            return ChoiceChip(
                              showCheckmark: false,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              label: Text(option),
                              selectedColor: AppColor.primary, // Selected color
                              selected: isSelected,
                              onSelected: (isSelected) {
                                if (isSelected) {
                                  if (selectedOptions[category['title']] ==
                                      null) {
                                    selectedOptions[category['title']] = [];
                                  }
                                  selectedOptions[category['title']]!
                                      .add(option);
                                } else {
                                  selectedOptions[category['title']]!
                                      .remove(option);
                                }
                                onSelectOptions(selectedOptions);
                                setState(() {
                                  debugPrint("Selected");
                                  isSelected = !isSelected;
                                });
                                // Update parent state
                              },
                            );
                          }).toList(),
                          // category['options'].map((options) {}).toList(),
                        ),
                        const SizedBox(
                          height: 12,
                        )
                        // ListTile(
                        //   title: Text(category['title']),
                        //   onTap: () => selectedOptions(category),
                        // ),
                      ],
                    );
                  },
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
