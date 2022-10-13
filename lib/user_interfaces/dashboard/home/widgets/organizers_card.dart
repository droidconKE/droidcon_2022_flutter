import 'package:flutter/material.dart';

import '../../../../assets/images.dart';
import '../../../colors/colors.dart';

class OrganizersCard extends StatelessWidget {
    List<String> _organizers = [
    AssetImages.android254Logo,
    AssetImages.kotlinLogo,
    AssetImages.kotlinKeLogo,
    AssetImages.appsLabLogo,
    AssetImages.earlyCampLogo,
    AssetImages.tiskosLogo,
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDark ? Colors.black : AppColors.lightGrayColor),
      child: Column(
        children: [
          Text('Organised by:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.blueColor,
                  fontSize: 18)),
          SizedBox(
            height: 20,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 20.0,
            spacing: 40.0,
            direction: Axis.horizontal,
            children: List.generate(
                _organizers.length,
                (index) => Image.asset(
                      _organizers[index],
                      scale: 2,
                    )),
          ),
        ],
      ),
    );
  }
}
