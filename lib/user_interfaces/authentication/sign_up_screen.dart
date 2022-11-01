import 'package:droidcon_app/user_interfaces/authentication/widgets/app_text_field.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/google_button.dart';
import 'package:droidcon_app/user_interfaces/widgets/primary_button.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/signup_image_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors/colors.dart';

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
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      GoogleButton(
                        onTap: () {
                          GoRouter.of(context).replace('/main-home');
                        },
                        label: 'Sign up with Google',
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
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              label: 'Sign me up'.toUpperCase(),
                              onPressed: () {
                                GoRouter.of(context).replace('/main-home');
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: AppColors.greyTextColor),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text.rich(TextSpan(
                          text: 'Sign in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GoRouter.of(context).go('/signin');
                            },
                          style: const TextStyle(
                              color: AppColors.orangeDroidconColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)))
                    ],
                  ),
                ))
          ],
        ));
  }
}
