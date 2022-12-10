import 'package:get/get.dart';
import 'package:rentx/app/screen/payment/controller/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
