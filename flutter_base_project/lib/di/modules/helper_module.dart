import 'package:flutter_base_project/domain/helpers/login/login_validator_helper.dart';
import 'package:flutter_base_project/domain/helpers/login/login_validator_helper_impl.dart';
import 'package:get_it/get_it.dart';

class HelperModule {
  static void setup(GetIt getIt) {
    // Login validator helper
    getIt.registerSingleton<LoginValidatorHelper>(LoginValidatorHelperImpl());
  }
}