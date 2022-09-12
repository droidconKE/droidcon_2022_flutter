import 'package:droidcon_app/user_interfaces/authentication/widgets/google_button.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/signup_image_background.dart';
import 'package:droidcon_app/user_interfaces/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = 'signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.greyDarkThemeBackground
            : Colors.white,
        body: Stack(
          children: [
            //The Background image
            const Positioned(
                left: 0, right: 0, top: 0, child: SignUpSVGBackground()),
            Positioned(
                top: 25,
                left: 25,
                child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
            Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    GoogleButton(
                      onTap: () {
                        print('object');
                      },
                    )
                  ],
                ))
          ],
        ));
  }
}
