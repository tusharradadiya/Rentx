import 'package:get/instance_manager.dart';
import 'package:rentx/app/screen/order_checkout/controller/order_checkout_controller.dart';

class OrderCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderCheckoutController>(() => OrderCheckoutController());
  }
}
