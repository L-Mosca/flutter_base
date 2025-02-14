import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class BaseClient {
  final HttpClient client = HttpClient();

  Future<HttpClientResponse?> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<HttpClientResponse?> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<HttpClientResponse?> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<HttpClientResponse?> delete(
    String url, {
    Map<String, String>? headers,
  });

  void close() {
    client.close(force: true);
  }

  void logRequest(HttpClientRequest request, {String? body}) {
    if (kDebugMode) {
      print('--- Request ---');
      print('Method: ${request.method}');
      print('URL: ${request.uri}');
      print('Headers: ${request.headers}');
      if (body != null) {
        print('Body: $body');
      }
      print('---------------');
    }
  }

  void logResponse(String response) async {
    if (kDebugMode) {
      print('--- Response ---');
      print('Body: $response');
      print('----------------');
    }
  }
}
