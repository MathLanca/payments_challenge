import 'package:payments_challenge_yuca/feature/data/dto/payment_detail.dto.dart';

class PaymentDetail {
  String? description;
  int? value;

  PaymentDetail({
    this.description,
    this.value,
  });

  factory PaymentDetail.fromDto(PaymentDetailDto dto) =>
      PaymentDetail(description: dto.description, value: dto.value);
}
