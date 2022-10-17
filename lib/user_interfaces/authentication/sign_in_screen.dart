import 'package:droidcon_app/user_interfaces/authentication/widgets/app_text_field.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/google_button.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/primary_button.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/signin_image_background.dart';
import 'package:droidcon_app/user_interfaces/colors/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = 'signin';
  const SignInScreen({Key? key}) : super(key: key);

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
                left: 0, right: 0, top: 0, child: SignInSVGBackground()),
            Positioned(
                top: 25,
                left: 25,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
            const Positioned(
                top: 90,
                left: 25,
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            Positioned(
                top: 180,
                left: 40,
                right: 40,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      GoogleButton(
                        onTap: () {},
                        label: 'Sign in with Google',
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
                        height: 70,
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
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              label: 'Sign in'.toUpperCase(),
                              onPressed: () {
                                GoRouter.of(context).push('/main-home');
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Text.rich(TextSpan(
                          text: 'Forgot password?',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black))),
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: AppColors.greyTextColor),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text.rich(TextSpan(
                          text: 'Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GoRouter.of(context).replace('/signup');
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
