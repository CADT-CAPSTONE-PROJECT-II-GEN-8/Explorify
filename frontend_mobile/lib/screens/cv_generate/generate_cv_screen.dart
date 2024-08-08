import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/home/widgets/choose_profile.dart';
import 'package:frontend_mobile/screens/home/widgets/select_file_name.dart';
import 'package:frontend_mobile/widget/app_bar.dart';

class GenerateCvScreen extends StatefulWidget {
  const GenerateCvScreen({super.key});

  @override
  State<GenerateCvScreen> createState() => _GenerateCvScreenState();
}

class _GenerateCvScreenState extends State<GenerateCvScreen> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.enText['cv_generate']!,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColor.primary),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    AppText.enText['cv_generate_text']!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColor.secondary),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const ChooseProfile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
