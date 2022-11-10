import 'package:flutter/material.dart';

class SignUpSVGBackground extends StatelessWidget {
  const SignUpSVGBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/signup_background_${Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light'}.png',
      fit: BoxFit.cover,
    );
  }
}
