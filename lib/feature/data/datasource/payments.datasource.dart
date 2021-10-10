import 'dart:convert';

import 'package:payments_challenge_yuca/feature/data/dto/payment.dto.dart';
import 'package:http/http.dart' as http;

class PaymentsDataSource {
  PaymentsDataSource();

  final String baseUrl = "private-42e99d-yuca1.apiary-mock.com";
  final String basePath = "/payments";

  Future<List<PaymentDto>?>? fetchPayments() async {
    final List response = await http
        .get(
      Uri.https(baseUrl, basePath),
    )
        .then((response) {
      final String result = utf8.decode(response.bodyBytes);
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error from server: $statusCode");
      }

      return json.decode(result);
    });

    List<PaymentDto> payments =
        response.map((payment) => PaymentDto.fromJson(payment)).toList();

    return payments;
  }
}
