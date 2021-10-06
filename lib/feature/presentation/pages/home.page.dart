import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/detail");
            },
            icon: const Icon(Icons.airplanemode_active),
          ),
        ),
      ),
    );
  }
}
