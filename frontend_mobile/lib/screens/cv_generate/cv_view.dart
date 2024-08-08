import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/home/widgets/choose_profile.dart';
import 'package:frontend_mobile/screens/home/widgets/select_file_name.dart';
import 'package:frontend_mobile/widget/app_bar.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewScreen extends StatefulWidget {
  const PDFViewScreen({super.key});

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImage.upperStyle),
            CustomAppBar(
              isCenter: true,
              showBackArrow: true,
              title: Text(
                AppText.enText['cv_title']!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              action: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            PDFView(
              
            )
          ],
        ),
      ),
    );
  }
}
