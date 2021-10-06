import 'package:payments_challenge_yuca/feature/data/payment_detail.dto.dart';

class Payment {
  String? status;
  double? value;
  String? dueDate;
  String? effectiveDate;
  List<PaymentDetail>? details;

  Payment.fromJson(Map json)
      : status = json["status"],
        value = json["value"],
        dueDate = json["dueDate"],
        effectiveDate = json["effectiveDate"],
        details = (json["details"] as List)
            .map((e) => PaymentDetail.fromJson((e as Map).map(
                  (key, value) => MapEntry(
                    key as String,
                    value,
                  ),
                )))
            .toList();
}
