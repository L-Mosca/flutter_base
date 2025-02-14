import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/data/repositories/user_repository_impl.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

class RepositoriesModule {
  static void setup(GetIt getIt) {
    getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(clientHelper: getIt<ClientHelper>()),
    );
  }
}
