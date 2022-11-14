import 'package:flutter/material.dart';

import 'afrikon_icon.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.color, this.onPressed});
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AfrikonIcon('left'),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
