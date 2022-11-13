import 'package:dio/dio.dart';
import 'package:droidcon_app/utils/utils.dart';

class ApiService {
  static RestClient restClient = RestClient();

  /// This method gets the data from the API
  /// Typically returns a dynamic object(usually a [Map<String, dynamic>] or a [List<dynamic>])
  static Future<dynamic> getData(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dio!.get('${restClient.baseUrl}/$path',
          options: options, queryParameters: queries);
      return response.data;
    } on DioError catch (e) {
      throw e.response?.data['message'] ?? e.toString();
    } catch (e) {
      throw 'An error has occurred - ${e.toString()}';
    }
  }

  /// This method posts the data to the API
  /// Typically returns a dynamic object
  static Future<dynamic> postData(
      {required String path,
      required data,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dio!.post('${restClient.baseUrl}/$path',
          data: data, options: options, queryParameters: queries);
      return response.data;
    } on DioError catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw 'An error has occurred';
    }
  }
}
