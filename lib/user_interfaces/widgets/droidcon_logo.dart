import 'package:droidcon_app/user_interfaces/widgets/theme_dialog.dart';
import 'package:flutter/material.dart';

import '../../assets/images.dart';

class DroidconLogo extends StatelessWidget {
  const DroidconLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const ThemeDialog();
            });
      },
      child: Image.asset(
        Theme.of(context).brightness == Brightness.dark
            ? AssetImages.droidconLogoWhite
            : AssetImages.droidconLogo,
        scale: 2,
      ),
    );
  }
}
