import 'package:payments_challenge_yuca/feature/domain/model/payment_detail.model.dart';

class Payment {
  String? status;
  double? value;
  String? dueDate;
  String? effectiveDate;
  List<PaymentDetail>? details;
}
