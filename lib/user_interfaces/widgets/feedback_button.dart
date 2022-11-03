import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/widgets/afrikon_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../feedback/feedback_screen.dart';

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
          children: const [
            AfrikonIcon(
                'smiley-outline',
                height: 12,
                color: AppColors.blackColor
            ),
            Text(
              'Feedback',
              style: TextStyle(color: AppColors.blackColor, fontSize: 12),
            ),
            AfrikonIcon('send', height: 12, color: AppColors.tealColor),
          ],
        ),
      ),
    );
  }
}
