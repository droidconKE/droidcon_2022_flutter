import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/services/api_service/api_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  static Future<LoginResponse> loginWithGoogle() async {
    // First authenticate the user with google auth
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    );
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Then do the API call
    try{
    var response = await ApiService.postData(
        path: 'social_login/google',
        data: {'access_token': googleAuth?.accessToken});
        return LoginResponse.fromJson(response);
    }on String catch(e){
      throw e;
    }
  }
}
