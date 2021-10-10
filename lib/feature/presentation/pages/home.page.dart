import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:payments_challenge_yuca/core/utils/date.utils.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/presentation/controllers/home.controller.dart';
import 'package:payments_challenge_yuca/feature/presentation/widgets/card.widget.dart';

class PaymentsHomePage extends StatefulWidget {
  const PaymentsHomePage({Key? key}) : super(key: key);

  @override
  _PaymentsHomePageState createState() => _PaymentsHomePageState();
}

class _PaymentsHomePageState extends State<PaymentsHomePage> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Pagamentos',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey.shade300,
          child: Observer(builder: (_) {
            if (_controller.isLoading!) {
              return _buildLoader();
            } else {
              return _controller.payments != null
                  ? _buildList(_controller.payments!, context)
                  : Container();
            }
          }),
        ),
      ),
    );
  }

  Widget _buildList(List<Payment> payments, BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _getCard(context, index, payments[index]),
      itemCount: payments.length,
    );
  }

  Widget _getCard(BuildContext context, int index, Payment payment) {
    switch (payment.status) {
      case "open":
        return PaymentCard(
          index: index,
          type: PaymentType.opened,
          title: "Mensalidade aberta",
          mainColor: const Color.fromRGBO(32, 177, 223, 1),
          icon: Icons.calendar_today_rounded,
          payment: payment,
        );
      case "paid":
        return PaymentCard(
          index: index,
          type: PaymentType.paid,
          title: "Mensalidade paga!",
          mainColor: const Color.fromRGBO(19, 192, 129, 1),
          icon: Icons.check_circle_outline,
          payment: payment,
        );
      case "closed":
        return PaymentCard(
          index: index,
          type: PaymentType.closed,
          title: "Mensalidade fechada",
          mainColor: const Color.fromRGBO(120, 100, 200, 1),
          icon: Icons.notes,
          payment: payment,
        );
      default:
        return Container();
    }
  }

  Widget _buildLoader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
