import 'package:flutter/material.dart';

import '../../../../models/session/session.dart';
import '../../../../styles/colors/colors.dart';
import '../../widgets/afrikon_icon.dart';

class BookmarkSessionButton extends StatelessWidget {
  const BookmarkSessionButton({
    super.key,
    required this.session,
  });

  final Session session;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: AfrikonIcon(
        session.isBookmarked ? 'star' : 'star-outline',
        height: 24,
        color:
            session.isBookmarked ? AppColors.orangeColor : AppColors.blueColor,
      ),
      onPressed: () {
        // TODO: Bookmark session
      },
    );
  }
}
