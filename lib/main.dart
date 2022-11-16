import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/google_fonts/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await runZonedGuarded(
    () async {
      final appDir = await getApplicationDocumentsDirectory();
      final storage = await HydratedStorage.build(storageDirectory: appDir);
      HydratedRiverpod.initialize(storage: storage);
      if (kDebugMode) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(false);
        await FirebasePerformance.instance
            .setPerformanceCollectionEnabled(false);
      }
      await dotenv.load(fileName: 'environments/.env');
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      ErrorWidget.builder = (FlutterErrorDetails error) {
        Zone.current.handleUncaughtError(error.exception, error.stack!);
        return ErrorWidget(error.exception);
      };
      FlutterNativeSplash.remove();
      runApp(ProviderScope(
        observers: [Logger()],
        child: const DroidconApp(),
      ));
    },
    (exception, stackTrace) {
      FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    },
  );
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "${previousValue.toString().replaceRange((previousValue.toString().length > 100 ? 100 : previousValue.toString().length), previousValue.toString().length, '...')}"
  "newValue": "${newValue.toString().replaceRange((newValue.toString().length > 100 ? 100 : newValue.toString().length), newValue.toString().length, '...')}"
}
''');
  }
}
