import 'package:logging/logging.dart';

class NetworkLogger {
  final Logger _logger = Logger((NetworkLogger).toString());

  void logRequest({
    String? body,
    required Map headers,
    required String method,
    required Uri uri,
  }) {
    _logger.fine('''
    -----------------------------------------------------------
    - START API REQUEST                                       -
    -----------------------------------------------------------
    URL: ${uri.toString()}
    Method: $method
    Headers: $headers
    Body: $body
    -----------------------------------------------------------''');
  }

  void logResponse({
    required Map headers,
    required String body,
    required int statusCode,
  }) {
    _logger.fine('''
    Status Code: $statusCode
    Headers: $headers
    Body: $body
    -----------------------------------------------------------
    - END API RESPONSE                                        -
    -----------------------------------------------------------''');
  }
}
