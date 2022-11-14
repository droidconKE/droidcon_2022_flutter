import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioErrorType.cancel:
        err.error = 'Request to API server was cancelled';
        break;
      case DioErrorType.connectTimeout:
        err.error = 'Connection to API server timed out';
        break;
      case DioErrorType.other:
        err.error =
            'Connection to API server failed due to internet connection';
        break;
      case DioErrorType.receiveTimeout:
        err.error = 'Receive timeout in connection with API server';
        break;
      case DioErrorType.sendTimeout:
        err.error = 'Send timeout in connection with API server';
        break;
      case DioErrorType.response:
        if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
          await FirebaseCrashlytics.instance.recordError(err, err.stackTrace,
              reason: '${err.response!.statusCode}: Server Response Error');
          // await Sentry.captureException(err, stackTrace: err.stackTrace);
        }
        if (err.response!.data != null) {
          if (err.response!.data is String) {
            err.error = '${err.response!.statusCode}: ${err.response!.data}';
          } else if (err.response!.data is List) {
            err.error = err.response!.data
                .map((el) => '${el['message']}\n')
                .toList()
                .join();
          } else {
            err.error = err.response!.data['message'].toString();
          }
          if (err.response!.statusCode == 404 && err.response!.data is String) {
            err.error = '${err.response!.statusCode}: Resource not found.';
          }
          if (err.response!.statusCode == 500 && err.response!.data is String) {
            err.error = '${err.response!.statusCode}: Internal server error.';
          }
        } else {
          err.error =
              'Received invalid status code: ${err.response!.statusCode}';
        }
        break;
    }
    return handler.next(err);
  }
}
