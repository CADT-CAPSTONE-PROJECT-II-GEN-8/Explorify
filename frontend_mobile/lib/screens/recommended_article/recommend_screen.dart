import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/apply.dart';
import 'package:frontend_mobile/provider/company_info_provider.dart';
import 'package:frontend_mobile/provider/job_detail_provider.dart';
import 'package:frontend_mobile/screens/cv_generate/upload_cv_screen.dart';
import 'package:frontend_mobile/screens/home/widgets/apply_button.dart';
import 'package:frontend_mobile/screens/home/widgets/tab_bar.dart';
import 'package:frontend_mobile/screens/home/widgets/text_tile.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/app_bar.dart';
import 'package:frontend_mobile/screens/home/widgets/job_info.dart';
import 'package:frontend_mobile/screens/home/widgets/company_info.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  bool isUpload = false;
  @override
  Widget build(BuildContext context) {
    final internshipInfo =
        Provider.of<InternshipProvider>(context).internshipInfo;
    final companyInfo =
        Provider.of<CompanyProfileProvider>(context).companyProfile;

    final uploadState = Provider.of<UploadState>(context);
    List<String> tabs = ['Job Description', 'About Company'];
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // -------APP BAR--------
          Image.asset(AppImage.upperStyle),
          CustomAppBar(
            isCenter: true,
            title: Text(
              AppText.enText['article_screen_title']!,
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
          // -------COMPANY NAME--------
        ]),
      ),
    ));
  }
}
