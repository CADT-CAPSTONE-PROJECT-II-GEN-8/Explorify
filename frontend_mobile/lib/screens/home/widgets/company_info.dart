import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/company_info_provider.dart';
import 'package:frontend_mobile/screens/home/widgets/bullet_list.dart';
import 'package:provider/provider.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final companyInfo =
        Provider.of<CompanyProfileProvider>(context).companyProfile;

    List<String> carouselImageItems = [
      'https://cdn.pixabay.com/photo/2021/03/29/12/16/stairs-6133971_1280.jpg',
      'https://cdn.pixabay.com/photo/2017/01/14/10/56/people-1979261_640.jpg',
      'https://media.istockphoto.com/id/1827291486/photo/a-dedicated-mentor-is-explaining-mentees-importance-of-project-while-sitting-at-the-boardroom.webp?b=1&s=170667a&w=0&k=20&c=MLRxSKvKfsfLubgWuMg-rLDj5QU_HJ07SKHBEh4f75w='
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -----JOB Description-----
            Text(
              AppText.enText['company_title']!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600, color: AppColor.primary),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.justify,
              companyInfo!.description ?? '',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.normal, color: AppColor.secondary),
            ),
            const SizedBox(
              height: 18,
            ),
            // -----JOB Requirement-----

            Text(
              AppText.enText['website_title']!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600, color: AppColor.primary),
            ),
            const SizedBox(
              height: 12,
            ),
            BulletList(
              const [
                'Sed ut perspiciatis unde omnis iste natus error sit.',
                'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.',
                'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            // -----JOB Location-----
            Text(
              AppText.enText['gallery_title']!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600, color: AppColor.primary),
            ),
            const SizedBox(
              height: 12,
            ),

            // CarouselSlider(
            //   items: carouselImageItems.map((item) {
            //     return Builder(builder: (BuildContext context) {
            //       return CarouselCard(imageUrl: item);
            //     });
            //   }).toList(),
            //   options: CarouselOptions(
            //       enlargeCenterPage: true,
            //       autoPlay: true,
            //       autoPlayInterval: const Duration(seconds: 3),
            //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
            //       autoPlayCurve: Curves.fastOutSlowIn),
            // )
          ],
        ),
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  final String imageUrl;
  const CarouselCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.grey,
      elevation: 10.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * 0.9,
          )),
    );
  }
}
