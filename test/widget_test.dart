import 'package:droidcon_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
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
