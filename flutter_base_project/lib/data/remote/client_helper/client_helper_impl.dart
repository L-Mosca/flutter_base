import 'package:flutter_base_project/data/remote/client/app_client.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';

class ClientHelperImpl implements ClientHelper {
  final AppClient client;

  ClientHelperImpl({required this.client});

  @override
  Future<String> test() async {
    return "test";
  }
}
