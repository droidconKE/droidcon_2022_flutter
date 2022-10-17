import 'package:flutter/material.dart';

import '../../../../assets/images.dart';
import '../../../colors/colors.dart';

class SponsorsCard extends StatelessWidget {
  const SponsorsCard({Key? key}) : super(key: key);
  final List<String> _sponsors = const [
    AssetImages.andelaLogo,
    AssetImages.hoverLogo,
    AssetImages.jetbrainsLogo
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDark ? Colors.black : AppColors.lightGrayColor),
      child: Column(
        children: [
          const Spacer(),
          Text('Sponsors',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.blueColor,
                  fontSize: 18)),
          const Spacer(),
          Image.asset(
            AssetImages.googleLogo,
            scale: 2,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                _sponsors.length,
                (index) => Image.asset(
                      _sponsors[index],
                      scale: 2,
                    )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
