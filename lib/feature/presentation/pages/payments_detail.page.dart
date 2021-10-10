import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:payments_challenge_yuca/core/utils/date.utils.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment_detail.model.dart';

import 'package:payments_challenge_yuca/feature/domain/model/payment_detail_arguments.dart';

class PaymentDetailPage extends StatefulWidget {
  PaymentDetailArguments? arguments;

  PaymentDetailPage({
    Key? key,
    this.arguments,
  }) : super(key: key);

  @override
  _PaymentDetailPageState createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  late Color mainColor;
  late Payment payment;
  late PaymentType type;

  @override
  void initState() {
    super.initState();
    mainColor = widget.arguments!.mainColor!;
    payment = widget.arguments!.payment!;
    type = widget.arguments!.type!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Mensalidades',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 44,
              color: mainColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Icon(
                      _getIcon(),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _getTitle(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                DateUtil()
                    .getLongMonthAndYear(payment.effectiveDate!)
                    .toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            Text(
              type == PaymentType.opened
                  ? "Fechamento em " +
                      DateUtil().getDayAndMonth(payment.dueDate!)
                  : "Vencimento em " +
                      DateUtil().getDayAndMonth(payment.dueDate!),
              style: const TextStyle(
                color: Color.fromRGBO(125, 125, 125, 1),
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: "Montserrat",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                    .format(payment.value),
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            const Divider(),
            _buildDetailList(payment.details!),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailList(List<PaymentDetail> details) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(),
        ),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(details[index].description!)),
              Flexible(
                child: Text(
                  NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                      .format(details[index].value),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: details[index].value! < 0
                          ? Colors.green
                          : Colors.black),
                ),
              ),
            ],
          );
        },
        itemCount: details.length,
      ),
    );
  }

  String _getTitle() {
    switch (type) {
      case PaymentType.opened:
        return "Mensalidade aberta";
      case PaymentType.closed:
        return "Mensalidade fechada";
      case PaymentType.paid:
        return "Pagamento realizado";
    }
  }

  IconData _getIcon() {
    switch (type) {
      case PaymentType.opened:
        return Icons.date_range;
      case PaymentType.closed:
        return Icons.article_outlined;
      case PaymentType.paid:
        return Icons.done;
    }
  }
}
