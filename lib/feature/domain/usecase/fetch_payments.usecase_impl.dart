import 'package:payments_challenge_yuca/feature/data/datasource/payments.datasource.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/domain/usecase/fetch_payments.usecase.dart';

class FetchPaymentsUseCaseImpl implements FetchPaymentsUseCase {
  PaymentsDataSource dataSource;

  FetchPaymentsUseCaseImpl(this.dataSource);

  @override
  Future<List<Payment>>? execute() {
    var x = dataSource.fetchPayments();
    return null;
  }
}
