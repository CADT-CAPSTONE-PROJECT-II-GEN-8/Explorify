import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/model/internship/internship_posting.dart';

class VerticleImage extends StatelessWidget {
  const VerticleImage({
    required this.internship,
    super.key,
    this.onTap,
    required this.image,
  });

  final String image;
  final Internship internship;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Container(
          width: 104,
          height: 118,
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // boxShadow: [
            //   BoxShadow(
            //       color: AppColor.grey,
            //       offset: Offset(0, 4),
            //       blurRadius: 10)
            // ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.appbBarColor.withOpacity(.4),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 24,
                    height: 24,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  internship.jobTitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: AppColor.secondary),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  internship.jobDuration,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: AppColor.midGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
