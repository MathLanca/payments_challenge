import 'package:payments_challenge_yuca/feature/data/dto/payment_detail.dto.dart';

class PaymentDto {
  String? status;
  int? value;
  String? dueDate;
  String? effectiveDate;
  List<PaymentDetailDto>? details;

  PaymentDto.fromJson(Map json)
      : status = json["status"],
        value = json["value"],
        dueDate = json["dueDate"],
        effectiveDate = json["effectiveDate"],
        details = (json["details"] as List)
            .map((e) => PaymentDetailDto.fromJson((e as Map).map(
                  (key, value) => MapEntry(
                    key as String,
                    value,
                  ),
                )))
            .toList();
}
