import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:page_transition/page_transition.dart';
import 'package:payments_challenge_yuca/core/network/http_client.dart';
import 'package:payments_challenge_yuca/feature/data/datasource/payments.datasource.dart';
import 'package:payments_challenge_yuca/feature/domain/usecase/fetch_payments.usecase.dart';
import 'package:payments_challenge_yuca/feature/domain/usecase/fetch_payments.usecase_impl.dart';
import 'package:payments_challenge_yuca/feature/presentation/controllers/home.controller.dart';
import 'package:payments_challenge_yuca/feature/presentation/pages/home.page.dart';
import 'package:payments_challenge_yuca/feature/presentation/pages/payments_detail.page.dart';

void main() {
  GetIt getIt = GetIt.I;

  getIt.registerFactory<HomeController>(() => HomeController(getIt()));
  getIt.registerFactory<PaymentsDataSource>(
      () => PaymentsDataSource(HttpClient()));
  getIt.registerFactory<FetchPaymentsUseCase>(
      () => FetchPaymentsUseCaseImpl(getIt()));

  initializeDateFormatting("pt_BR", null).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaymentsHomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/home":
            return PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const PaymentsHomePage(),
            );
          case "/detail":
            return PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const PaymentDetailPage(),
            );
        }
      },
    );
  }
}
