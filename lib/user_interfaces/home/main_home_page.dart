import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  static const routeName = 'main-home';
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Home Page'),
      ),
      body: Container(),
    );
  }
}
