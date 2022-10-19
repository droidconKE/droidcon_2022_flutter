import 'dart:async';

import 'package:droidcon_app/utils/rest_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      WidgetsFlutterBinding.ensureInitialized();
      final storage = await HydratedStorage.build(
          storageDirectory: await getApplicationDocumentsDirectory());
      HydratedRiverpod.initialize(storage: storage);
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (kDebugMode) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(false);
        await FirebasePerformance.instance
            .setPerformanceCollectionEnabled(false);
      }
      await dotenv.load(
          fileName: 'environments/${kDebugMode ? 'debug.env' : '.env'}');
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      /// register the [RestClient] in as a singleton
      GetIt.I.registerSingleton<RestClient>(RestClient());
      GetIt.I.allowReassignment = true;
      ErrorWidget.builder = (FlutterErrorDetails error) {
        Zone.current.handleUncaughtError(error.exception, error.stack!);
        return ErrorWidget(error.exception);
      };

      runApp(const ProviderScope(child: DroidconApp()));
    },
    (exception, stackTrace) {
      FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    },
  );
}
