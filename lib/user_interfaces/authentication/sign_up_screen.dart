import 'package:droidcon_app/user_interfaces/authentication/widgets/app_text_field.dart';
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
            const Positioned(
                top: 90,
                left: 25,
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            Positioned(
                top: 180,
                left: 40,
                right: 40,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    GoogleButton(
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    const Text(
                      '- OR -',
                      style: TextStyle(
                          color: AppColors.greyTextColor, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const AppTextField(
                      name: 'username',
                      hint: 'Username',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTextField(
                      name: 'email',
                      hint: 'Email address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTextField(
                      name: 'password',
                      hint: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTextField(
                      name: 'confirm_password',
                      hint: 'Confirm password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ],
        ));
  }
}
