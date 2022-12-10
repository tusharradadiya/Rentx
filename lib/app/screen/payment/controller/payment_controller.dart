import 'package:get/get.dart';
import 'package:pay/pay.dart';

class PaymentController extends GetxController {
  final Pay _payClient =
      Pay.withAssets(['assets/default_payment_profile_google_pay.json']);

  final _paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayPressed() async {
    final result = await _payClient.showPaymentSelector(
      provider: PayProvider.google_pay,
      paymentItems: _paymentItems,
    );
    // Send the resulting Google Pay token to your server / PSP
  }
}
