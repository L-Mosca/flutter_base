import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class BaseClient {
  final HttpClient client = HttpClient();

  Future<dynamic> get({
    required String url,
    Map<String, String>? headers,
  });

  Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    Object? body,
  });

  Future<dynamic> put({
    required String url,
    Map<String, String>? headers,
    Object? body,
  });

  Future<dynamic> delete({
    required String url,
    Map<String, String>? headers,
  });

  void close() => client.close(force: true);

  void logRequest(HttpClientRequest request, {String? body}) {
    if (kDebugMode) {
      log('================================================================');
      log('--- Request ---');
      log('Method: ${request.method}');
      log('URL: ${request.uri}');
      log('Headers: ${request.headers}');
      if (body != null) {
        log('Body: $body');
      }
      log('================================================================\n');
    }
  }
}

extension HttpClientRequestExtensions on HttpClientRequest {
  Future<dynamic> getResponseBody() async {
    final response = await close();
    return response.body();
  }

  void build({Map<String, dynamic>? header, Object? body}) {
    addHeaders(header);
    addBody(body);
  }

  void addHeaders(Map<String, dynamic>? header) {
    headers.add("Content-Type", "application/json");
    if (header != null) header.forEach((key, value) => headers.add(key, value));
  }

  void addBody(Object? body) {
    if (body != null) {
      final bodyString = json.encode(body);
      write(bodyString);
    }
  }
}

extension HttpClientResponseExtension on HttpClientResponse {
  Future<dynamic> body() async {
    final raw = await transform(utf8.decoder).join();

    if (kDebugMode) {
      log('==============================================================\n');
      log('--- Response ---');
      log('Body: $raw');
      log('\n==============================================================\n');
    }

    return jsonDecode(raw);
  }
}
