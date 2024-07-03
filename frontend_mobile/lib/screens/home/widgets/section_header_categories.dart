import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class SectionHeadingCategory extends StatelessWidget {
  const SectionHeadingCategory({
    super.key,
    required this.title,
    required this.buttonIcon,
    this.textColor,
    this.onPressed,
  });

  final String title;
  final IconData buttonIcon;
  final Color? textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            buttonIcon,
          ),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColor.secondary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
