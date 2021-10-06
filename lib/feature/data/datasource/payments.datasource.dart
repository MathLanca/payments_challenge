import 'dart:convert';

import 'package:payments_challenge_yuca/core/network/http_client.dart';
import 'package:payments_challenge_yuca/feature/data/dto/payment.dto.dart';
import 'package:http/http.dart' as http;

class PaymentsDataSource {
  HttpClient _httpClient;

  final JsonDecoder _decoder = const JsonDecoder();

  PaymentsDataSource(this._httpClient);

  final String baseUrl = "private-42e99d-yuca1.apiary-mock.com";
  final String basePath = "/payments";

  Future<List<Payment>>? fetchPayments() {
    List<Payment>? payments;
    http.get(Uri.https(baseUrl, basePath)).then((response) {
      final String result = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error from server: $statusCode");
      }
      List<Map<String, dynamic>> decoded = _decoder.convert(result);

      return null;
    });
  }
}
