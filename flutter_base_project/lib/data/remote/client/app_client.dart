import 'dart:io';

import 'package:flutter_base_project/data/remote/client/base_client.dart';

class AppClient extends BaseClient {
  @override
  Future<HttpClientResponse?> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    return null;
  }

  @override
  Future<HttpClientResponse?> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    return null;
  }

  @override
  Future<HttpClientResponse?> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    return null;
  }

  @override
  Future<HttpClientResponse?> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    return null;
  }
}
