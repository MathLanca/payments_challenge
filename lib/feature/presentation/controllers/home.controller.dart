import 'package:mobx/mobx.dart';
import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';
import 'package:payments_challenge_yuca/feature/domain/usecase/fetch_payments.usecase.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FetchPaymentsUseCase _useCase;

  @observable
  List<Payment>? payments;

  _HomeControllerBase(this._useCase) {
    fetchPayments();
  }

  @action
  void fetchPayments() {
    var x = _useCase.execute();
  }
}
