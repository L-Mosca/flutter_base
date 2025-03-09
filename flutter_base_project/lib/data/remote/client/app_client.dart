import 'package:flutter_base_project/data/remote/client/base_client.dart';

class AppClient extends BaseClient {
  @override
  Future<dynamic> delete({
    required String url,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(url);
    final request = await client.deleteUrl(uri);
    request.build(header: headers);
    return request.getResponseBody();
  }

  @override
  Future<dynamic> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(url);
    final request = await client.getUrl(uri);
    request.build(header: headers);
    logRequest(request);
    return request.getResponseBody();
  }

  @override
  Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final uri = Uri.parse(url);
    final request = await client.postUrl(uri);
    request.build(header: headers, body: body);
    logRequest(request, body: body.toString());
    return request.getResponseBody();
  }

  @override
  Future<dynamic> put({
    required String url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final uri = Uri.parse(url);
    final request = await client.putUrl(uri);
    request.build(header: headers, body: body);
    return request.getResponseBody();
  }
}
