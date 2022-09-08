import 'package:droidcon_app/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CupertinoSwitch(
              value: ref.watch(systemThemeProvider),
              onChanged: (val) {
                ref.read(systemThemeProvider.notifier).toggle();
              }),
          CupertinoSwitch(
              value: ref.watch(darkThemeProvider),
              onChanged: (val) {
                ref.read(darkThemeProvider.notifier).toggle();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(darkThemeProvider.notifier).toggle();
      }),
    );
  }
}
