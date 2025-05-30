import 'package:flutter_base_project/data/local/shared_preferences/preferences_helper.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/data/repositories/cart_repository_impl.dart';
import 'package:flutter_base_project/data/repositories/product_repository_impl.dart';
import 'package:flutter_base_project/data/repositories/settings_repository_impl.dart';
import 'package:flutter_base_project/data/repositories/user_repository_impl.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';
import 'package:flutter_base_project/domain/repositories/settings_repository.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

class RepositoriesModule {
  static void setup(GetIt getIt) {
    // User Repository
    getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(
        clientHelper: getIt<ClientHelper>(),
        preferencesHelper: getIt<PreferencesHelper>(),
      ),
    );

    // Product Repository
    getIt.registerSingleton<ProductRepository>(
      ProductRepositoryImpl(
        clientHelper: getIt<ClientHelper>(),
        preferencesHelper: getIt<PreferencesHelper>(),
      ),
    );

    // Settings Repository
    getIt.registerSingleton<SettingsRepository>(
      SettingsRepositoryImpl(preferencesHelper: getIt<PreferencesHelper>()),
    );

    // Cart Repository
    getIt.registerSingleton<CartRepository>(
      CartRepositoryImpl(preferencesHelper: getIt<PreferencesHelper>()),
    );
  }
}
