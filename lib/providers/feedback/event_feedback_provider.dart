import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dio/dio_provider.dart';

class FeedbackRepository {
  FeedbackRepository(this.ref);

  final ProviderRef ref;

  Future<Response> postEventFeedback(Map<String, dynamic> feedback) async {
    try {
      return ref
          .read(dioClientProvider)
          .post('/events/droidconke-2022-281/feedback', data: feedback);
    } on DioError catch (e) {
      throw e.message;
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }
}

// We expose our instance of Repository in a provider
final feedbackRepositoryProvider = Provider((ref) => FeedbackRepository(ref));
