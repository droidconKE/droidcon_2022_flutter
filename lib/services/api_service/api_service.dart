import 'package:dio/dio.dart';
import 'package:droidcon_app/utils/utils.dart';

class ApiService {
  RestClient restClient = RestClient();

  /// This method gets the data from the API
  /// Typically returns a dynamic object(usually a [Map<String, dynamic>] or a [List<dynamic>])
  Future<dynamic> getData(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    var response = await restClient.dio!.get('${restClient.baseUrl!}/$path',
        options: options, queryParameters: queries);
    return response.data;
  }

  /// This method posts the data to the API
  /// Typically returns a dynamic object
  Future<dynamic> postData(
      {required String path,
      required data,
      Options? options,
      Map<String, dynamic>? queries}) async {
    var response = await restClient.dio!.post('${restClient.baseUrl!}/$path',
        data: data, options: options, queryParameters: queries);
    return response.data;
  }
}
