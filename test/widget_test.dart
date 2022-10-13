import 'package:droidcon_app/app.dart';
import 'package:droidcon_app/styles/dark_theme.dart';
import 'package:droidcon_app/styles/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

class MockFirebase extends Mock implements Firebase {}

void main() async {
  testWidgets('Home page test ;-)', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await tester.pumpWidget(const DroidconApp());
    expect(find.text('Home'), findsOneWidget);
  });
}

Widget createHomeScreen(Widget screen) => MaterialApp(
    //  routerDelegate: GoRouter(routes: [
    //   GoRoute(path: '/',
    //   builder: ((context, state) => screen)
    //   )
    //  ]).routerDelegate,
    home: screen,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
    );
