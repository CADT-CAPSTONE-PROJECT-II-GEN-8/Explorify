import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/model/article/article_model.dart';

class DetailsScreen extends StatelessWidget {
  final Post item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDetail(item, context),
    );
  }

  Widget _buildDetail(Post item, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider("https://www.chieflearningofficer.com/wp-content/uploads/2023/05/AdobeStock_577015054.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${item.title}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 21, 11, 61),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Implement save functionality if needed
                          },
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.bookmark_border),
                              SizedBox(width: 8),
                              Icon(Icons.favorite, color: Colors.red),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Text(
                      "${item.slug ?? 'No description available.'}",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 242, 124, 28),
                          fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Text(
                      "${item.content ?? 'No description available.'}",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
