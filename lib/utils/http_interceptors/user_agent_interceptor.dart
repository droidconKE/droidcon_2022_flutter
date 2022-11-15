import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';

class UserAgentInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final packageInfo = await PackageInfo.fromPlatform();
    options.headers['User-Agent'] =
        '${packageInfo.packageName}/${packageInfo.buildNumber} - ${packageInfo.appName}/${packageInfo.version}';
    handler.next(options);
  }
}
