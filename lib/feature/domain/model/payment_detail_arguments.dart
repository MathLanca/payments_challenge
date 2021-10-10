import 'package:flutter/material.dart';

import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';

class PaymentDetailArguments {
  Payment? payment;
  Color? mainColor;
  PaymentType? type;

  PaymentDetailArguments({
    this.payment,
    this.mainColor,
    this.type,
  });
}
