import 'package:payments_challenge_yuca/feature/domain/model/payment.model.dart';

abstract class FetchPaymentsUseCase {
  Future<List<Payment>>? execute();
}
