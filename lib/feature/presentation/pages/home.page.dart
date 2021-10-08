import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/presentation/controllers/home.controller.dart';

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
              return _buildCards(_controller.payments!, context);
            }
          }),
        ),
      ),
    );
  }

  _buildCards(List<Payment> payments, BuildContext context) {
    if (payments == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.separated(
          itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 13),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Color.fromRGBO(32, 177, 223, 1),
                                ),
                              ),
                              Text(
                                "Mensalidade Aberta",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color.fromRGBO(32, 177, 223, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        width: double.infinity,
                        height: 64,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: 89,
                      )
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Container(),
          itemCount: payments.length),
    );
  }

  _buildLoader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
