import 'dart:convert';

import 'package:payments_challenge_yuca/core/network/http_client.dart';
import 'package:payments_challenge_yuca/feature/data/dto/payment.dto.dart';
import 'package:http/http.dart' as http;

class PaymentsDataSource {
  HttpClient _httpClient;

  PaymentsDataSource(this._httpClient);

  final String baseUrl = "private-42e99d-yuca1.apiary-mock.com";
  final String basePath = "/payments";

  Future<List<Payment>>? fetchPayments() {
    http.get(Uri.https(baseUrl, basePath)).then((response) {
      final String result = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error from server: $statusCode");
      }
      List parsedList = json.decode(result);
      List<Payment> payments =
          parsedList.map((val) => Payment.fromJson(val)).toList();
      return payments;
    });
  }
}
