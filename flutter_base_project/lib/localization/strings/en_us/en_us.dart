import 'package:flutter_base_project/localization/strings/app_localization.dart';

class EnUs extends AppLocalization {
  @override String get appName => "Fake Store";

  // Login Page
  @override String get loginFailure => "Invalid credentials";
  @override String get username => "Username";
  @override String get password => "Password";
  @override String get login => "Login";
  @override String get or => "or";
  @override String get dontHaveAccount => "Don't have an account?";
  @override String get clickHere => "Click Here";
  @override String get welcome => "Welcome to";
  @override String get signInToContinue => "Sign in to continue";
  @override String get invalidUsername => "Invalid username";
  @override String get invalidPassword => "Invalid password";
}