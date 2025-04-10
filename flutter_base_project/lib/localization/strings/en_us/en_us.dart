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

  // Product Detail Page
  @override String get addToCart => "Add To Cart";
  @override String get somethingWrong => "Something went worng";
  @override String get productDetailError => "An error has occurred to search product details, please try again later.";
  @override String get tryAgain => "Try again";

  // Settings Page
  @override String get settings => "Settings";
  @override String get darkMode => "Dark mode";
  @override String get logout => "Logout";

  // Cart Page
  @override String get cart => "Cart";
  @override String get checkOut => "Check Out";
  @override String get items => "Items";
  @override String get tax => "Tax";
  @override String get totalPrice => "Total Price";
}