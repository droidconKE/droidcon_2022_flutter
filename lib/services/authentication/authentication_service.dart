
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/models.dart';
import '../api_service/api_service.dart';

class AuthenticationService {
  /// Login with Google
  static Future<LoginResponse> loginWithGoogle() async {
    // First authenticate the user with google auth
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Then do the API call
    try {
      var response = await ApiService.postData(
          path: 'social_login/google',
          data: {'access_token': googleAuth?.accessToken});
      return LoginResponse.fromJson(response);
    } on String {
      rethrow;
    }
  }
}
