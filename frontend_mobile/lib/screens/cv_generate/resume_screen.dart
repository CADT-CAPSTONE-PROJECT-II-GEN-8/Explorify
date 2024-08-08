import 'dart:io';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:frontend_mobile/screens/home/services/cv_generate_service.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({super.key, this.file});
  final File? file;

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  int _current = 0;
  dynamic _selectedIndex = {};

  final CarouselSliderController _carouselController =
      CarouselSliderController();
  CvGenerateService cvGenerateService = CvGenerateService();
  final List<dynamic> _products = [
    {
      'id': 1,
      'title': 'Free',
      'image': 'assets/images/cv1-1.png',
    },
    {
      'id': 2,
      'title': 'Free',
      'image': 'assets/images/cv2-1.png',
    },
    {
      'id': 3,
      'title': 'Pro',
      'image': 'assets/images/cv3-1.png',
    },
    {
      'id': 4,
      'title': 'Pro',
      'image': 'assets/images/cv4-1.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 234, 155, 121),
        title: const Text(
          'RESUME',
          style: TextStyle(
            letterSpacing: 0.5,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(child: _buildCVScroll()),
        _buildBottom(),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }

  Widget _buildCVScroll() {
    return SizedBox(
      width: double.infinity,
      height: 420.0, // Set fixed height
      child: CarouselSlider(
        controller: _carouselController,
        options: CarouselOptions(
          height: 420.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.70,
          enlargeCenterPage: true,
          pageSnapping: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: _products.map((product) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = (_selectedIndex == product) ? {} : product;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 228, 212),
                    borderRadius: BorderRadius.circular(20),
                    border: _selectedIndex == product
                        ? Border.all(
                            color: const Color.fromARGB(255, 250, 199, 154),
                            width: 3)
                        : null,
                    boxShadow: _selectedIndex == product
                        ? [
                            const BoxShadow(
                              color: Color.fromARGB(255, 251, 215, 187),
                              blurRadius: 30,
                              offset: Offset(0, 10),
                            )
                          ]
                        : [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            )
                          ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 330,
                          margin: const EdgeInsets.only(top: 20),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            product['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          product['title']!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 216, 104, 56),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          // Perform an action when the button is pressed
          cvGenerateService.myCV(
              context: context, imageFile: widget.file!, templateId: _current);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 236, 116, 52),
          elevation: 2,
          minimumSize:
              const Size(350, 60), // Adjust the width and height as needed
          padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30), // Add padding for a bigger touch area
        ),
        child: const Text(
          'Generate',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
