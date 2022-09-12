import 'package:droidcon_app/user_interfaces/authentication/widgets/signup_image_background.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = 'signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [SignUpSVGBackground()],
    ));
  }
}
