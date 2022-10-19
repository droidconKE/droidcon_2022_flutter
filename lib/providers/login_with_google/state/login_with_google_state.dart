import 'package:droidcon_app/models/login_response/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_google_state.freezed.dart';

@freezed
class LoginWithGoogleState with _$LoginWithGoogleState {
  factory LoginWithGoogleState.initial() = _Initial;
  factory LoginWithGoogleState.loading() = _Loading;
  factory LoginWithGoogleState.success(LoginResponse response) = _Success;
  factory LoginWithGoogleState.failed(String message) = _Error;
}
