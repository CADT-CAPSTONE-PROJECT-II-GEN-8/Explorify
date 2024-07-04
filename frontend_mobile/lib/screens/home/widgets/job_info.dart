import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/company_info_provider.dart';
import 'package:frontend_mobile/provider/job_detail_provider.dart';
import 'package:frontend_mobile/screens/home/widgets/apply_button.dart';
import 'package:frontend_mobile/screens/home/widgets/bullet_list.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:provider/provider.dart';

class JobInfo extends StatelessWidget {
  const JobInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final internshipInfo =
        Provider.of<InternshipProvider>(context).internshipInfo;
    List<String> requirements = internshipInfo!.jobRequirement.split(',');
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -----JOB Description-----
              Text(
                AppText.enText['job_title']!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.primary),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                textAlign: TextAlign.justify,
                internshipInfo!.jobDescription,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal, color: AppColor.secondary),
              ),
              const SizedBox(
                height: 18,
              ),
              // -----JOB Requirement-----

              Text(
                AppText.enText['job_requirement_title']!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.primary),
              ),
              const SizedBox(
                height: 12,
              ),
              BulletList(requirements),
              const SizedBox(
                height: 18,
              ),
              // -----JOB Location-----
              Text(
                AppText.enText['job_location_title']!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.primary),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                textAlign: TextAlign.justify,
                internshipInfo.location,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal, color: AppColor.secondary),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primary),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
