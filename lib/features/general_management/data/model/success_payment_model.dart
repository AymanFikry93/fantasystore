import '../helper/extensions/checkout_type.dart';

class SuccessPaymentArgs {
  void Function({String? url}) onSuccessPay;
  CheckoutType checkoutType;

  SuccessPaymentArgs({
    required this.onSuccessPay,
    required this.checkoutType,
  });
}
