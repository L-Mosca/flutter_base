import 'package:flutter_base_project/data/remote/client/app_client.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper_impl.dart';
import 'package:get_it/get_it.dart';

class ApiModule {
  static void setup(GetIt getIt) {
    getIt.registerSingleton<AppClient>(AppClient());
    getIt.registerSingleton<ClientHelper>(
      ClientHelperImpl(client: getIt<AppClient>()),
    );
  }
}
