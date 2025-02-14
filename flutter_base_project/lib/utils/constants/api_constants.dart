import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:flutter/services.dart';

/* -- LIST OF Constants used in APIs -- */
class APIConstants {
  static const String tSecretApiKey = "test";
}

class GetKeys {
  final String apiKey;
  final String apiToken;

  GetKeys({this.apiKey = "", this.apiToken = ""});

  factory GetKeys.fromJson(Map<String, dynamic> jsonMap) {
    return GetKeys(
      apiKey: jsonMap["api_key"],
      apiToken: jsonMap["api_token"],
    );
  }
}

class KeysLoader {
  final String path;

  KeysLoader({this.path = ".keys.json"});

  Future<GetKeys> load() {
    return rootBundle.loadStructuredData<GetKeys>(path, (jsonString) async {
      final keys = GetKeys.fromJson(json.decode(jsonString));
      return keys;
    });
  }
}
