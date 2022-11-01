import 'package:droidcon_app/afrikon_icon.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.tealColor),
        child: const AfrikonIcon('locked', color: Colors.white, height: 15),
      ),
    );
  }
}
