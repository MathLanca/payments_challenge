import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  final JsonDecoder _decoder = const JsonDecoder();

  Future get({
    required String url,
    required String path,
  }) {
    return http.get(Uri.https(url, path)).then((response) {
      final String result = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error from server: $statusCode");
      }

      return _decoder.convert(result);
    });
  }
}
