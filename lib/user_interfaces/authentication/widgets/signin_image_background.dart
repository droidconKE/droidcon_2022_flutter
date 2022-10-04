import 'package:flutter/material.dart';

class SignInSVGBackground extends StatelessWidget {
  const SignInSVGBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/signin_background_${Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light'}.png',
    );
  }
}
