import 'package:get/get.dart';
import 'package:rentx/app/screen/order_history/controller/order_history_controller.dart';

class OrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryController>(
        () => OrderHistoryController(Get.find()));
  }
}
