import 'package:droidcon_app/providers/providers.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeDialog extends ConsumerWidget {
  const ThemeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'What is your prefered theme?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                ),
                const SizedBox(height: 20),

                ///Use system
                ThemeWidget(
                    label: 'Use system theme',
                    onTap: () {
                      ref.read(systemThemeProvider.notifier).toggle();
                    },
                    selected: ref.watch(systemThemeProvider)),
                const SizedBox(height: 20),

                ///Use light theme
                ThemeWidget(
                    label: 'Use light theme',
                    onTap: () {
                      ref.read(systemThemeProvider.notifier).setUser();
                      ref.read(darkThemeProvider.notifier).setLight();
                    },
                    selected: !ref.watch(darkThemeProvider) &&
                        !ref.watch(systemThemeProvider)),
                const SizedBox(height: 20),

                ///Use dark theme
                ThemeWidget(
                    label: 'Use dark theme',
                    onTap: () {
                      ref.read(darkThemeProvider.notifier).setDark();
                      ref.read(systemThemeProvider.notifier).setUser();
                    },
                    selected: ref.watch(darkThemeProvider) &&
                        !ref.watch(systemThemeProvider)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        label: 'Dismiss',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function()? onTap;
  const ThemeWidget(
      {Key? key, required this.label, required this.selected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: selected ? 70 : 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                duration: const Duration(milliseconds: 500),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeIn,
                  crossFadeState:
                      Theme.of(context).brightness == Brightness.dark
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  firstChild: Image.asset(
                    'assets/images/signin_background_light.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  secondChild: Image.asset(
                    'assets/images/signin_background_dark.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
