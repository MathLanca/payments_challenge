import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payments_challenge_yuca/core/utils/date.utils.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment_detail_arguments.dart';

class PaymentCard extends StatelessWidget {
  int? index;
  PaymentType? type;
  Color? mainColor;
  Payment? payment;
  String? title;
  IconData? icon;

  PaymentCard({
    Key? key,
    this.index,
    this.type,
    this.mainColor,
    this.payment,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      child: SizedBox(
        child: Column(
          children: [
            // Header
            Container(
              width: double.maxFinite,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                color: type == PaymentType.opened ? null : mainColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Icon(
                      icon,
                      color:
                          type == PaymentType.opened ? mainColor : Colors.white,
                    ),
                  ),
                  Text(
                    title!,
                    style: TextStyle(
                      color:
                          type == PaymentType.opened ? mainColor : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            if (type == PaymentType.opened) const Divider(),
            // Content
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                DateUtil()
                    .getLongMonthAndYear(payment!.effectiveDate!)
                    .toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                type == PaymentType.opened
                    ? "Fechamento em " +
                        DateUtil().getDayAndMonth(payment!.dueDate!)
                    : "Vencimento em " +
                        DateUtil().getDayAndMonth(payment!.dueDate!),
                style: const TextStyle(
                  color: Color.fromRGBO(125, 125, 125, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                    .format(payment?.value),
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRoundedButton(
                    text: "VER DETALHES",
                    useMainColorInBackGround: false,
                    context: context,
                  ),
                  if (type == PaymentType.closed)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: _buildRoundedButton(
                          text: "PAGAR",
                          useMainColorInBackGround: true,
                          context: context),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedButton(
      {required String text,
      required bool useMainColorInBackGround,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/detail",
              arguments: PaymentDetailArguments(
                mainColor: mainColor,
                payment: payment,
                type: type,
              ));
        },
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: useMainColorInBackGround ? Colors.white : mainColor,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(
            useMainColorInBackGround ? mainColor! : Colors.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.0),
              side: const BorderSide(
                color: Color.fromRGBO(242, 242, 242, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
