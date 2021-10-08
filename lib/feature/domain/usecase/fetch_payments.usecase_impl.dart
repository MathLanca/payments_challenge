import 'package:payments_challenge_yuca/feature/data/datasource/payments.datasource.dart';
import 'package:payments_challenge_yuca/feature/data/dto/payment.dto.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/domain/usecase/fetch_payments.usecase.dart';

class FetchPaymentsUseCaseImpl implements FetchPaymentsUseCase {
  PaymentsDataSource dataSource;

  FetchPaymentsUseCaseImpl(this.dataSource);

  @override
  Future<List<Payment>?>? execute() async {
    final response =
        await dataSource.fetchPayments()?.then((List<PaymentDto>? result) {
      return Payment.fromListDto(result!);
    });

    return response;
  }
}
