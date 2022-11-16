import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/colors/colors.dart';

class GoogleButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;

  const GoogleButton({Key? key, this.onTap, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 208,
      decoration: BoxDecoration(
        color: AppColors.lightGrayBackgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey),
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: onTap,
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SvgPicture.asset('assets/svgs/google.svg')),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
