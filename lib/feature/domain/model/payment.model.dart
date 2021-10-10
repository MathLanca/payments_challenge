import 'package:payments_challenge_yuca/feature/data/dto/payment.dto.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment_detail.model.dart';

class Payment {
  String? status;
  int? value;
  String? dueDate;
  String? effectiveDate;
  List<PaymentDetail>? details;

  Payment({
    this.status,
    this.value,
    this.dueDate,
    this.effectiveDate,
    this.details,
  });

  static List<Payment>? fromListDto(List<PaymentDto> list) {
    return list.map((element) {
      return Payment.fromDto(element);
    }).toList();
  }

  factory Payment.fromDto(PaymentDto dto) => Payment(
        dueDate: dto.dueDate,
        effectiveDate: dto.effectiveDate,
        status: dto.status,
        value: dto.value,
        details: dto.details?.map((e) => PaymentDetail.fromDto(e)).toList(),
      );
}

enum PaymentType { opened, closed, paid }
