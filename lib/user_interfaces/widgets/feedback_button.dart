import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors/colors.dart';
import '../feedback/feedback_screen.dart';
import 'afrikon_icon.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(FeedbackScreen.routeName);
      },
      child: Container(
        height: 30,
        width: 127,
        decoration: BoxDecoration(
          color: AppColors.tealColor.withOpacity(.21),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AfrikonIcon(
              'smiley-outline',
              height: 12,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.greyTextColor
                  : AppColors.blackColor,
            ),
            Text(
              'Feedback',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 12),
            ),
            const AfrikonIcon('send', height: 12, color: AppColors.tealColor),
          ],
        ),
      ),
    );
  }
}
