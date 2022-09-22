import 'package:flutter/material.dart';

import 'afrikon_icon.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          AfrikonIcon('locked', color: Colors.red),
          Text('Home'),
        ],
      ),
    );
  }
}
