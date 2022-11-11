import 'package:flutter/material.dart';

import '../../assets/images.dart';

class DroidconLogo extends StatelessWidget {
  const DroidconLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Theme.of(context).brightness == Brightness.dark
          ? AssetImages.droidconLogoWhite
          : AssetImages.droidconLogo,
      scale: 2,
    );
  }
}
