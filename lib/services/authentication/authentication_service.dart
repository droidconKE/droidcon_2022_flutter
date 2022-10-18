import 'package:droidcon_app/services/api_service/api_service.dart';
import 'package:droidcon_app/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  static loginWithGoogle() async {
    // First authenticate the user with google auth
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Then do the API call
    var response = await ApiService.postData(
        path: 'social_login/google',
        data: {'access_token': googleAuth?.accessToken});
  }
}
