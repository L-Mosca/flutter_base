import 'package:flutter_base_project/domain/helpers/login/login_validator_helper.dart';

class LoginValidatorHelperImpl implements LoginValidatorHelper {
  static const int emptyUsername = 1;
  static const int emptyPassword = 2;

  @override
  int? checkLoginFields({required String username, required String password}) {
    if (username.isEmpty) return emptyUsername;
    if (password.isEmpty) return emptyPassword;
    return null;
  }
}
