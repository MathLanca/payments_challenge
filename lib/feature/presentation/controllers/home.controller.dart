import 'package:mobx/mobx.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/domain/usecase/fetch_payments.usecase.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FetchPaymentsUseCase _useCase;

  @observable
  List<Payment>? payments;

  @observable
  bool? isLoading;

  _HomeControllerBase(this._useCase) {
    fetchPayments();
  }

  @action
  void fetchPayments() {
    isLoading = true;
    _useCase.execute()?.then((result) {
      isLoading = false;
      payments = result;
    });
  }
}
