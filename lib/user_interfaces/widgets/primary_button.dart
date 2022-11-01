import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const PrimaryButton({Key? key, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : AppColors.blueDroidconColor,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
