import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/model/article/article_model.dart';
import 'package:frontend_mobile/screens/artical/detail_screen.dart';
import 'package:frontend_mobile/screens/artical/services/article_service.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

final List<IconData> buttonIcon = [
  Icons.home,
  Icons.design_services, // Changed to design-related icon
  Icons.person, // Changed to soft skill-related icon
  Icons.code, // Changed to backend-related icon
  Icons.developer_mode, // Changed to developer-related icon
];
final List<String> title = [
  "Upskill",
  "Design",
  "Softskill",
  "Backend",
  "Developer",
];

int selectedIndex = 0;

class _ArticleScreenState extends State<ArticleScreen> {
  ArticleService articleService = ArticleService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color to white
      body: _buildBody(),
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    List<Map<String, dynamic>> sampleData = [
      {
        'title': 'Future of Work Trends',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .',
        'image':
            'https://www.chieflearningofficer.com/wp-content/uploads/2023/05/AdobeStock_577015054.jpeg',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'Skill Needs for Different',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .',
        'image':
            'https://sloanreview.mit.edu/wp-content/uploads/2021/05/GEN-Palmer-Skills-Atrophy-1290x860-1.jpg',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'A Day in the Life of as student',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .',
        'image':
            'https://www.21kschool.com/in/wp-content/uploads/sites/4/2022/10/Will-Graduation-become-Irrelevant-in-the-Age-of-Skill-based-Education-1.png',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'Sample Article 3',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque ',
        'image':
            'https://www.netsolutions.com/insights/wp-content/uploads/2022/06/how-to-become-a-software-developer.webp',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'Development Life Cycle',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque ',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGvLJOyDqTP40tXu2LdXWH0AdrGmdpFrsVD0iSfBgV4bNxioEeKRQN1ffnOg6LpXkKlzQ&usqp=CAU',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
    ];

    return Future.delayed(const Duration(seconds: 2), () => sampleData);
  }

  // Widget _buildText() {
  //   return Column(
  //     children: [
  //       Image.asset(AppImage.upperStyle),
  //       const CustomAccountAppBar(
  //         showBackArrow: true,
  //         leadingIconColor: Colors.black,
  //         title: Text(
  //           "Artical",
  //           style: TextStyle(
  //             color: AppColor.black,
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildBody() {
    return Column(
      children: [
        Image.asset(AppImage.upperStyle),
        const Column(
          children: [
            CustomAccountAppBar(
              showBackArrow: false,
              leadingIconColor: Colors.black,
              title: Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text(
                  "Artical",
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
        _buildMenuBar(),
        _buildTextTitles(),
        const SizedBox(height: 15),
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: [
              _buildApi(),
              _buildApi(),
              _buildApi(),
              _buildApi(),
              _buildApi(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextTitles() {
    return const Padding(
      padding: EdgeInsets.only(left: 25, top: 5),
      child: Align(
        alignment: Alignment.centerLeft, // Aligns the container to the left
        child: Text(
          'Getting Started ',
          textAlign: TextAlign.left, // Aligns text to the left
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar() {
    return Container(
      height: 150,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttonIcon.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    // color: Colors.grey[100],
                    width: 65,
                    height: 65,

                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color.fromARGB(255, 255, 244, 233)
                          : const Color.fromARGB(153, 247, 247, 245),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        buttonIcon[index],
                        color: isSelected
                            ? const Color.fromARGB(255, 250, 86, 4)
                            : const Color.fromARGB(255, 21, 11, 61),
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title[index],
                    style: TextStyle(
                      color: isSelected
                          ? const Color.fromARGB(255, 250, 86, 4)
                          : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildApi() {
    return Center(
      child: FutureBuilder<List<Post>>(
        future: articleService.getPostDetials(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildListView(snapshot.data ?? []);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Post> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(Post item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(26.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
        color: Colors.transparent, // Set the Card color to transparent
        elevation: 0, // Remove the Card elevation to avoid shadow overlap
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // image: DecorationImage(
                  //   image: CachedNetworkImageProvider(item.),
                  //   fit: BoxFit.cover,
                  //   onError: (error, stackTrace) => Container(
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGvLJOyDqTP40tXu2LdXWH0AdrGmdpFrsVD0iSfBgV4bNxioEeKRQN1ffnOg6LpXkKlzQ&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 242, 124, 28),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(
                          Icons.bookmark_border,
                          color: Color.fromARGB(255, 82, 75, 107),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.content,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(item: item), // Pass the item here
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Read more ",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(153, 247, 247, 245),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Color.fromARGB(255, 21, 11, 61)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
