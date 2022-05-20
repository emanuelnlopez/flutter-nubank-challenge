import 'dart:io';
import 'package:codingexercise/src/services/client/client.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  final _headers = {
    HttpHeaders.contentTypeHeader: ContentType.json.toString(),
    HttpHeaders.acceptHeader: ContentType.json.toString(),
  };

  final NetworkLogger _logger = NetworkLogger();

  Future<http.Response> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final requestHeaders = _headers;
    requestHeaders.addAll(headers ?? {});

    _logger.logRequest(
      headers: requestHeaders,
      method: 'GET',
      uri: uri,
    );

    final response = await http.get(
      uri,
      headers: requestHeaders,
    );

    _logger.logResponse(
      body: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );

    return response;
  }

  Future<http.Response> post(
    Uri uri, {
    String? body,
    Map<String, String>? headers,
  }) async {
    final requestHeaders = _headers;
    requestHeaders.addAll(headers ?? {});

    _logger.logRequest(
      body: body,
      headers: requestHeaders,
      method: 'POST',
      uri: uri,
    );

    final response = await http.post(
      uri,
      headers: requestHeaders,
      body: body,
    );

    _logger.logResponse(
      body: response.body,
      headers: response.headers,
      statusCode: response.statusCode,
    );

    return response;
  }
}
