import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/user_provider.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/profile/widget/costom_appBar.dart';
import 'package:provider/provider.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/profile_img.png",
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.white),
                  ),
                  Text(
                    user.email,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Country",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColor.white),
              ),
              Text(
                "Job Title",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColor.white),
              ),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, RouteManager.editProfileScreen);
                },
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust the radius as needed
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.2), // Transparent white color
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Edit Profile",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.white),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.edit,
                        color: AppColor.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
