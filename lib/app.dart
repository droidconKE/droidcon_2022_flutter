import 'package:droidcon_app/router.dart';
import 'package:flutter/material.dart';

class DroidconApp extends StatelessWidget {
  const DroidconApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DroidconKe 2022',
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
